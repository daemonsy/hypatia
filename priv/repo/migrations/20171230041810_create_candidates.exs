defmodule Hypatia.Repo.Migrations.CreateCandidates do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext"
    create table(:candidates) do
      add :first_name, :string, null: false, size: 120
      add :last_name, :string, null: false, size: 120
      add :email, :citext, null: false
      add :email_confirmed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
