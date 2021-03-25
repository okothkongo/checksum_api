defmodule ChecksumApi.Endpoint do
  use Plug.Router
  #   alias ChecksumApi.Server
  plug(Plug.Logger)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: JSON
  )

  plug(:dispatch)

  get "/add_digits/:digits" do
    conn
    |> put_resp_content_type("application/json")
    |> add_digits_response()
  end

  match _ do
    send_resp(conn, 404, "Unknown request")
  end

  defp add_digits_response(%{params: %{"digits" => digits}} = conn) do
    case Integer.parse(digits) do
      {digits, ""} ->
        ChecksumApi.add_digits(digits)

        send_resp(conn, 200, "Digits add successfully")

      _ ->
        send_resp(conn, 404, "Only integers are allowed")
    end
  end
end
