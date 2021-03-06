import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :acortador, Acortador.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "acortador_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :acortador_web, AcortadorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "aYjNpyJKmDV0/fQT4UjFDQzI4UU+pE6EssLJqsykxTv+QPQB/eh2eVc4FZHe/qz6",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :acortador, Acortador.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Configure JUnit Formatter to output test results to a custom dir
config :junit_formatter,
  report_dir: Path.expand("_build/test/lib/acortador"),
  prepend_project_name?: true
