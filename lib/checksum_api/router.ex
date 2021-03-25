defmodule ChecksumApi.Router do
  use Plug.Router

  get "/add_digits" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, JSON.encode!(%{digits: ""}))
  end

  match _ do
    send_resp(conn, 404, "Unknown request")
  end
end
