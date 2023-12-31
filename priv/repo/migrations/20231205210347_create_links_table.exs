defmodule ExShort.Repo.Migrations.CreateLinksTable do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :url, :string
      add :hash, :string

      timestamps()
    end
  end
end
