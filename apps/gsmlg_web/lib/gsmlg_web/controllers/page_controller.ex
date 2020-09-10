defmodule GSMLGWeb.PageController do
  use GSMLGWeb, :controller
  plug :put_layout, false

  def index(conn, _params) do
    if Mix.env() == :prod do
      conn
      |> put_resp_content_type("text/html")
      |> send_file(200, Path.join([Application.app_dir(:gsmlg_web), "priv", "static", "index.html"]))
      |> halt()
    else
      conn
      |> render("index.html")
    end
  end

  def not_found(conn, _params) do
    if Mix.env() == :prod do
      conn
      |> put_resp_content_type("text/html")
      |> send_file(404, Path.join([Application.app_dir(:gsmlg_web), "priv", "static", "index.html"]))
      |> halt()
    else
      conn
      |> put_status(404)
      |> render("index.html")
    end
  end
end
