defmodule Hypatia.Job do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Job

  schema "jobs" do
    field :title, :string, null: false
    has_many :candidates, Hypatia.Candidate
    has_many :job_applications, Hypatia.JobApplication
    has_one :fieldset, Hypatia.Fieldset

    timestamps()
  end

  @doc false
  def changeset(%Job{} = job, attrs) do
    job
    |> cast(attrs, [:title, :enabled])
    |> validate_required([:title, :enabled])
  end
end
