defmodule ExCosmic.Repo do
  use Ecto.Repo,
    otp_app: :ex_cosmic,
    adapter: Ecto.Adapters.Postgres
end
