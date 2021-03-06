use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :hypatia, HypatiaWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :hypatia, Hypatia.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("POSTGRES_USER") || System.cmd("whoami", []) |> elem(0) |> String.replace("\n", ""),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: "hypatia_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
