defmodule ExShort.Links do
  alias ExShort.Repo
  alias ExShort.Links.Link
  import Ecto.Query

  def create(params) do
    %Link{}
    |> Link.changeset(params)
    |> Repo.insert()
  end

  def get_url_by_hash(hash) do
    from(l in Link, as: :link)
    |> where([link: l], l.hash == ^hash)
    |> limit(1)
    |> Repo.one()
  end
end
