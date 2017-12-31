defmodule Hypatia.Repo.Migrations.CreateFields do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS pgcrypto")
    create table(:fields) do
      add :uuid, :uuid, default: fragment("gen_random_uuid()")
      add :name, :string, null: false
      add :type, :string, null: false
      add :fieldset_id, references(:fieldsets, on_delete: :delete_all)

      timestamps()
    end

    create index(:fields, [:fieldset_id])
  end
end
