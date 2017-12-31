defmodule Hypatia.Repo.Migrations.CreateFieldsets do
  use Ecto.Migration

  def change do
    create table(:fieldsets) do
      add :name, :string, default: "Default", null: false
      add :job_id, references("jobs"), null: false

      timestamps()
    end
  end
end
