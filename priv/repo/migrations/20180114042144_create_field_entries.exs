defmodule Hypatia.Repo.Migrations.CreateFieldEntries do
  use Ecto.Migration

  def change do
    create table(:field_entries) do
      add :uuid, :uuid, default: fragment("gen_random_uuid()")
      add :job_application_id, references("job_applications")
      add :name, :string, null: false
      add :type, :string, null: false
      add :question, :string
      add :answer, :string
      add :required, :boolean, default: false, null: false

      timestamps()
    end
  end
end
