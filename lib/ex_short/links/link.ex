defmodule ExShort.Links.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:url]
  @optional [:hash]
  @primary_key {:id, :binary_id, autogenerate: true}
  schema "links" do
    field :url, :string
    field :hash, :string, default: nil

    timestamps()
  end

  def changeset(schema \\ %__MODULE__{}, params) do
    schema
    |> cast(params, @required ++ @optional)
    |> validate_required(@required)
    |> put_hash()
  end

  defp put_hash(%Ecto.Changeset{changes: %{url: url}} = changeset) do
    put_change(changeset, :hash, create_hash(url))
  end

  defp create_hash(url) do
    :crypto.hash(:sha, url) |> Base.encode64()
  end
end
