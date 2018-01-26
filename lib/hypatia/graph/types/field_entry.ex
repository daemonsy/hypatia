defmodule Hypatia.Graph.Types.FieldEntry do
  use Absinthe.Schema.Notation

  object :field_entry do
    field :name, non_null(:string)
    field :required, non_null(:boolean)
    field :answer, :string
  end
end
