defmodule Hypatia.Graph.Schema do
  use Absinthe.Schema

  import_types Hypatia.Graph.Scalars.JSON
  import_types Hypatia.Graph.Types.Candidate
  import_types Hypatia.Graph.Types.Job
  import_types Hypatia.Graph.Mutations.JobApplication
  import_types Hypatia.Graph.Types.JobApplication
  import_types Hypatia.Graph.Types.FieldEntry

  query do
    field :candidate, :candidate do
      arg :id, non_null(:id)
      resolve fn %{id: id}, _ ->
        {:ok, Hypatia.Candidate |> Hypatia.Repo.get(id) }
      end
    end

    field :all_jobs, list_of(:job) do
      description "Returns all jobs"

      resolve fn _, _ ->
        {:ok, Hypatia.Repo.all(Hypatia.Job)}
      end
    end
  end

  mutation do
    import_fields :job_application_mutations #Hypatia.Graph.Mutations.CreateJobApplication
  end
end
