defmodule Hypatia.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :title, :string
      add :enabled, :boolean, default: false, null: false

      timestamps()
    end
  end
end