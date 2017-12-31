defmodule Hypatia.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Job

  schema "jobs" do
    field :title, :string, null: false
    has_many :candidates, Hypatia.Candidate

    timestamps()
  end

  @doc false
  def changeset(%Job{} = job, attrs) do
    job
    |> cast(attrs, [:title, :enabled])
    |> validate_required([:title, :enabled])
  end
end
