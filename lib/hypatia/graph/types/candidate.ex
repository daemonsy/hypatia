defmodule Hypatia.Graph.Types.Candidate do
  use Absinthe.Schema.Notation

  object :candidate do
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
    field :email, non_null(:string)

    field :job_applications, list_of(non_null(:job_application))
  end
end
