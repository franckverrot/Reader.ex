defmodule ReaderEx.Router do
  use ReaderEx.Web, :router

  pipeline :browser do
    plug CORSPlug, [origin: Application.get_env(:reader_ex, :frontend_uri)]
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, [origin: Application.get_env(:reader_ex, :frontend_uri)]
    plug :accepts, ["json"]
  end

  scope "/", ReaderEx do
    pipe_through :browser # Use the default browser stack
  end

  scope "/", ReaderEx do
    pipe_through :api
    get "/cb", OauthController, :oauth_callback
    options "/feeds", FeedController, :options
    resources "/feeds", FeedController
    resources "/entries", EntryController
  end
end
