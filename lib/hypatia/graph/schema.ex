defmodule Hypatia.Graph.Schema do
  use Absinthe.Schema

  import_types Hypatia.Graph.Types.Candidate
  import_types Hypatia.Graph.Types

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
end
