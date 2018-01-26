defmodule Hypatia.Graph.Types.JobApplication do
  use Absinthe.Schema.Notation

  object :job_application do
    description "A candidate's application for a job"
    field :id, :id
    field :fields, non_null(list_of(non_null(:field_entry)))
  end
end
