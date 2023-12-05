defmodule ExShort.Links do
  alias ExShort.Repo
  alias ExShort.Links.Link

  def create(params) do
    %Link{}
    |> Link.changeset(params)
    |> Repo.insert()
  end
end
