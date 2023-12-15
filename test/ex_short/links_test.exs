defmodule ExShort.LinksTest do
  use ExShort.DataCase, async: true
  alias ExShort.Links

  describe "create" do
    test "should create a link" do
      params = %{url: "foo.com"}

      assert {:ok, %Links.Link{}} = Links.create(params)
    end

    test "should not create a link if no url is provided" do
      assert {:error,
              %Ecto.Changeset{
                valid?: false,
                errors: [url: {"can't be blank", [validation: :required]}]
              }} = Links.create(%{})
    end
  end

  describe "get_url_by_hash" do
    setup [:create_link]

    test "should return a link", %{link: %{hash: h, url: u}} do
      assert %Links.Link{hash: ^h, url: ^u} = Links.get_url_by_hash(h)
    end

    test "should  not return a link" do
      assert nil == Links.get_url_by_hash("foo")
    end
  end

  def create_link(_) do
    {:ok, link} = %{url: "foo.com"} |> Links.create()
    %{link: link}
  end
end
