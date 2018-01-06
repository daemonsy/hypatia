defmodule Hypatia.Graph.Scalars.JSON do
  use Absinthe.Schema.Notation

  scalar :json, description: "Representation for JSON strings" do
    parse &({ :ok, Poison.decode!(&1.value) })
    serialize &Poison.encode!/1
  end
end
