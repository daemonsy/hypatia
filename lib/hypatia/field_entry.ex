defmodule Hypatia.FieldEntry do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.FieldEntry

  @primary_key false
  embedded_schema do
    field :name, :string
    field :type, :string
    field :question, :string
    field :required, :boolean
    field :answer
    field :notes, :string
    field :meta, :map
    field :uuid, Ecto.UUID
  end

  def changeset(%FieldEntry{} = field, attributes) do
    field
    |> cast(attributes, [:name, :type, :question, :answer, :meta, :required])
    |> validate_required([:name, :type, :required])
    |> validate_inclusion(:type, Hypatia.Field.supported_types)
    |> validate_required_answer_present
  end

  defp validate_required_answer_present(%Ecto.Changeset{ changes: %{ required: true } } = changeset) do
    changeset
    |> validate_required([:answer])
  end

  defp validate_required_answer_present(%Ecto.Changeset{ changes: %{ required: _ } } = changeset) do
    changeset
  end
end
