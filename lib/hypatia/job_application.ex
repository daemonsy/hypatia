defmodule Hypatia.JobApplication do
  use Ecto.Schema
  import Ecto.Changeset
  import Enum, only: [map: 2, filter: 2]
  alias Hypatia.JobApplication
  alias Hypatia.FieldEntry

  schema "job_applications" do
    belongs_to :candidate, Hypatia.Candidate
    belongs_to :job, Hypatia.Job
    embeds_many :fields, FieldEntry

    timestamps()
  end

  @doc false
  def changeset(%JobApplication{} = job_application, attrs) do
    job_application
    |> cast(attrs, [])
    |> cast_assoc(:job)
    |> cast_assoc(:candidate)
    |> cast_embed(:fields, required: true, with: &FieldEntry.changeset/2)
  end
end
