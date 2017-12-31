defmodule Hypatia.Field do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Field

  schema "fields" do
    field :name, :string
    field :type, :string
    field :fieldset_id, :id
    field :uuid, Ecto.UUID, read_after_writes: true

    timestamps()
  end

  @doc false
  def changeset(%Field{} = field, attrs) do
    field
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
