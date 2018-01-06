defmodule Hypatia.Graph.Mutations.JobApplication do
  use Absinthe.Schema.Notation
  import Hypatia.Repo, only: [get!: 3, insert!: 1]
  import Ecto, only: [build_assoc: 3]

  object :job_application_mutations do
    field :create_job_application, type: :job_application do
      description "Creates a job application given a candidate and job"

      arg :job_id, non_null(:id), description: "The id of the job"
      arg :candidate_id, non_null(:id), description: "The id of the candidate"
      arg :data, :json, description: "The data required by the application form"

      resolve fn(object, args, context) ->
        application = %Hypatia.JobApplication{
          job: get!(Hypatia.Job, args.job_id, []),
          candidate: get!(Hypatia.Candidate, args.candidate_id, []),
          data: args.data }

        |> insert!

        {:ok, application}
      end
    end
  end
end
