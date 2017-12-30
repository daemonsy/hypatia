defmodule Hypatia.Schema.Helpers do
  def by_id(model, ids) do
    import Ecto.Query

    ids = ids |> Enum.uniq

    model
    |> where([m], m.id in ^ids)
    |> Hypatia.Repo.all
    |> Map.new(&{&1.id, &1})
  end
end
