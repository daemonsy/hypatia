defmodule Hypatia.Graph.Mutations.JobApplication do
  use Absinthe.Schema.Notation
  import Ecto, only: [build_assoc: 3]
  import Enum, only: [map: 2]

  alias Hypatia.Repo
  alias Hypatia.Candidate
  alias Hypatia.Job
  alias Hypatia.{JobApplication, JobApplication.Field}

  object :job_application_mutations do
    field :create_job_application, type: :job_application do
      description "Creates a job application given a candidate and job"

      arg :job_id, non_null(:id), description: "The id of the job"
      arg :candidate_id, non_null(:id), description: "The id of the candidate"
      arg :fields, non_null(:json), description: "Field values represented as a JSON object with [field_name] : [value]"

      resolve fn(object, args, context) ->
        job = Repo.get!(Job, args.job_id) |> Repo.preload([fieldset: :fields])
        candidate = Repo.get!(Candidate, args.candidate_id)

        mapped_fields = job.fieldset.fields |> map(fn field ->
          %{
            name: field.name,
            type: field.type,
            uuid: field.uuid,
            required: field.required,
            question: field.question,
            answer: args.fields[field.uuid]
          }
        end)

        application = JobApplication.changeset(
          %JobApplication{ job: job, candidate: candidate },
          %{ fields: mapped_fields }
        )
        |> Repo.insert!

        {:ok, application}
      end
    end
  end
end
