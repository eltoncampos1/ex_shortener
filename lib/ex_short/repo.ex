defmodule ExShort.Repo do
  use Ecto.Repo,
    otp_app: :ex_short,
    adapter: Ecto.Adapters.Postgres
end
