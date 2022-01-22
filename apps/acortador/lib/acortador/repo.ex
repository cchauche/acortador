defmodule Acortador.Repo do
  use Ecto.Repo,
    otp_app: :acortador,
    adapter: Ecto.Adapters.Postgres
end
