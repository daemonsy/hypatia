defmodule Hypatia.Candidate do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Candidate

  schema "candidates" do
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    has_many :job_applications, Hypatia.Job.Application
    timestamps()
  end

  @doc false
  def changeset(%Candidate{} = candidate, attrs) do
    candidate
    |> cast(attrs, [])
    |> validate_required([])
  end
end
