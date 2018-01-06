defmodule Hypatia.JobApplication do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.JobApplication

  schema "job_applications" do
    belongs_to :candidate, Hypatia.Candidate
    belongs_to :job, Hypatia.Job
    field :data, :map

    timestamps()
  end

  @doc false
  def data_changeset(%{} = data, %{} = changes, fields) do
    all_fields = fields
    |> Enum.map(fn(field) -> {field.name, field.type} end)
    |> Map.new

    required_fields = fields
    |> Enum.filter(fn(field) -> field.required end)
    |> Enum.map(fn(field) -> field.name end)

    {data, all_fields}
    |> cast(changes, Map.keys(all_fields))
    |> validate_required(required_fields)
  end

  @doc false
  def changeset(%JobApplication{} = job_applications, attrs) do
    job_applications
    |> cast(attrs, [])
    |> validate_required([])
  end
end
