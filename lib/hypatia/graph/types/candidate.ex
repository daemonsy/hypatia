defmodule Hypatia.Graph.Types.Candidate do
  use Absinthe.Schema.Notation

  object :candidate do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
  end
end
