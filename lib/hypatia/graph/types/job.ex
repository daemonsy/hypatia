defmodule Hypatia.Graph.Types.Job do
  use Absinthe.Schema.Notation

  object :job do
    description "A job that candidates may submit applications for"

    field :id, :id
    field :title, :string, description: "Public title of the job"
    field :enabled, :boolean, description: "Whether the job is in use"
  end
end
