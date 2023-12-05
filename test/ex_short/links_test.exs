defmodule ExShort.LinksTest do
  use ExShort.DataCase, async: true
  alias ExShort.Links

  describe "create" do
    test "should create a link" do
      params = %{url: "foo.com"}

      assert {:ok, %Links.Link{}} = Links.create(params)
    end
  end
end
