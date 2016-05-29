defmodule ReaderEx.FeedController do
  use ReaderEx.Web, :controller
  require Logger

  alias ReaderEx.Feed

  plug :scrub_params, "feed" when action in [:create, :update]

  def index(conn, _params) do
    feeds = Repo.all(Feed)
    render(conn, "index.json", feeds: feeds)
  end

  def create(conn, %{"feed" => feed_params}) do
    HTTPoison.start
    url = feed_params["url"]
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get(url)
    {:ok, original_feed, _} = FeederEx.parse(body)

    entries = Enum.map(original_feed.entries,
                         fn(entry) ->
                           %ReaderEx.Entry{title: entry.title, link: entry.link}
                         end)

    changeset = %Feed{}
                  |> Repo.preload(:entries)
                  |> Feed.changeset(%{name: original_feed.title, url: url})
                  |> Ecto.Changeset.change
                  |> Ecto.Changeset.put_assoc(:entries, entries)

    case Repo.insert(changeset) do
      {:ok, feed} ->
        conn |> render("create_success.json", feed: feed)

      {:error, changeset} -> conn |> render("create_error.json", changeset: changeset)
    end
  end
end
