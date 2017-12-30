defmodule HypatiaWeb.GraphController do
  alias Hypatia.Graph.Schema, as: Schema
  use HypatiaWeb, :controller

  def execute(conn, %{"query" => query}) do
    {:ok, results} = Absinthe.run(query, Schema)

    json(conn, results)
  end
end
