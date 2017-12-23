defmodule Hypatia.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Job


  schema "jobs" do
    field :enabled, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Job{} = job, attrs) do
    job
    |> cast(attrs, [:title, :enabled])
    |> validate_required([:title, :enabled])
  end
end
