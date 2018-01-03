defmodule Hypatia.Repo.Migrations.AddDataCollectionColumnsToJobApplications do
  use Ecto.Migration

  def change do
    alter table("job_applications") do
      add :data, :jsonb, null: false
    end
  end
end
