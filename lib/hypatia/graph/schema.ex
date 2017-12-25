defmodule Hypatia.Graph.Schema do
  use Absinthe.Schema

  import_types Hypatia.Graph.Types

  query do
    field :all_jobs, list_of(:job) do
      description "Returns all jobs"

      resolve fn _, _ ->
        {:ok, Hypatia.Repo.all(Hypatia.Job)}
      end
    end
  end
end
