defmodule Bapi.Repo do
  use Ecto.Repo,
    otp_app: :bapi,
    adapter: Ecto.Adapters.Postgres
end
