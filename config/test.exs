use Mix.Config

# Configure your database
config :ecto_foreign_delete_app, EctoDelete.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ecto_foreign_delete_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
