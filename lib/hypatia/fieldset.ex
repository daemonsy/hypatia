defmodule Hypatia.Fieldset do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hypatia.Fieldset


  schema "fieldsets" do
    field :name, :string
    has_many :fields, Hypatia.Field
    belongs_to :job, Hypatia.Job

    timestamps()
  end

  @doc false
  def changeset(%Fieldset{} = fieldset, attrs) do
    fieldset
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
