defmodule ReaderEx.OauthController do
  use ReaderEx.Web, :controller
  plug :action

  def oauth_callback(conn, %{code: code}) do
    HTTPoison.start

    # Get token from code
    client_id     = Application.get_env(:reader_ex, :client_id)
    client_secret = Application.get_env(:reader_ex, :client_secret)
    authorize_url = Application.get_env(:reader_ex, :authorize_url)
    frontend_uri  = Application.get_env(:reader_ex, :frontend_uri)

    client_config = %{client_secret: client_secret, client_id: client_id}
    payload = client_config |> Map.merge(code)
    body = Poison.encode! payload
    headers = [{"Content-Type", "application/json"},{"Accept", "application/json"}]
    {:ok, response} = HTTPoison.post authorize_url, body, headers

    body = response.body |> Poison.decode!

    # Get user details. Just redirect to the front-end for now
    {:ok, response} = body["access_token"] |> fetch_user_details
    redirect conn, external: (frontend_uri <> "/?user=" <> response.body)
  end

  defp fetch_user_details token do
    headers = [
      {"Authorization", "token #{token}"},
      {"Content-Type", "application/json"},
      {"Accept", "application/json"}]
    user_endpoint_url = Application.get_env(:reader_ex, :user_endpoint_url)
    HTTPoison.get user_endpoint_url, headers
  end
end
