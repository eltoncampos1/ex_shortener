defmodule ExShortWeb.UrlController do
  use ExShortWeb, :controller
  alias ExShort.Links

  def redirect_to(conn, %{"hash" => hash}) do
    case Links.get_url_by_hash(hash) do
      nil ->
        conn
        |> put_status(:ok)
        |> json(%{foo: "bar"})

      %Links.Link{url: url} ->
        redirect(conn, external: url)
    end
  end
end
