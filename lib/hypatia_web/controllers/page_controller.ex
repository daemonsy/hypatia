defmodule HypatiaWeb.PageController do
  use HypatiaWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
