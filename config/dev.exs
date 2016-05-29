use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :reader_ex, ReaderEx.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

# Watch static and templates for browser reloading.
config :reader_ex, ReaderEx.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :reader_ex, ReaderEx.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "franck",
  password: "",
  database: "reader_ex_dev",
  hostname: "localhost",
  pool_size: 10

config :reader_ex, :client_id,         System.get_env("GITHUB_CLIENT_ID")
config :reader_ex, :client_secret,     System.get_env("GITHUB_CLIENT_ID")
config :reader_ex, :authorize_url,     "https://github.com/login/oauth/access_token"
config :reader_ex, :user_endpoint_url, "https://api.github.com/user"
config :reader_ex, :frontend_uri,      "http://localhost:8000"
