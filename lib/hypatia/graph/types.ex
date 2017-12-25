defmodule Hypatia.Graph.Types do
  use Absinthe.Schema.Notation

  @desc "A job that candidates may submit applications for"
  object :job do
    field :id, :id
    field :title, :string, description: "Public title of the job"
    field :enabled, :boolean, description: "Whether the job is in use"
  end
end
