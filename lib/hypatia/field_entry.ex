defmodule Hypatia.FieldEntry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.FieldEntry

  schema "field_entries" do
    field :uuid, Ecto.UUID, read_after_writes: true
    field :name, :string
    field :type, :string
    field :question, :string
    field :required, :boolean
    field :answer

    timestamps()
  end

  def changeset(%FieldEntry{} = field, attributes) do
    field
    |> cast(attributes, [:name, :type, :question, :answer, :required])
    |> validate_required([:name, :type, :required])
    |> validate_inclusion(:type, Hypatia.Field.supported_types)
    |> validate_required_answer_present
  end

  defp validate_required_answer_present(%Ecto.Changeset{ changes: %{ required: true } } = changeset) do
    changeset
    |> validate_required([:answer])
  end

  defp validate_required_answer_present(%Ecto.Changeset{ changes: %{ required: false } } = changeset) do
    changeset
  end
end
