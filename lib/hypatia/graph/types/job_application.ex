defmodule Hypatia.Graph.Types.JobApplication do
  use Absinthe.Schema.Notation

  object :job_application do
    description "A candidate's application for a job"
    field :id, :id
    field :fields, :json
  end
end
