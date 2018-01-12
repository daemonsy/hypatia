defmodule Hypatia.Field do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Field
  alias Hypatia.Fieldset

  @supported_types ["text", "selections", "date", "datetime", "choice"]

  schema "fields" do
    belongs_to :fieldset, Fieldset
    field :name, :string
    field :type, :string
    field :question, :string
    field :required, :boolean
    field :uuid, Ecto.UUID, read_after_writes: true

    timestamps()
  end

  def supported_types do
    @supported_types
  end

  @doc false
  def changeset(%Field{} = field, attrs) do
    field
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
    |> validate_inclusion(:type, @supported_types)
  end
end
