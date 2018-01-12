defmodule Hypatia.Repo.Migrations.AddDataCollectionColumnsToJobApplications do
  use Ecto.Migration

  def change do
    alter table("job_applications") do
      add :fields, { :array, :map }, default: [], null: false
    end
  end
end
