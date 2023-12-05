defmodule ExShort.Repo.Migrations.AddHashIndex do
  use Ecto.Migration

  def change do
    create index(:links, [:hash])
  end
end
