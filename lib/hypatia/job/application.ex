defmodule Hypatia.Job.Application do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Job.Application

  schema "job_applications" do
    belongs_to :candidate, Hypatia.Candidate
    timestamps()
  end

  @doc false
  def changeset(%Application{} = applications, attrs) do
    applications
    |> cast(attrs, [])
    |> validate_required([])
  end
end
