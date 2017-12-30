defmodule Hypatia.Repo.Migrations.CreateJobApplications do
  use Ecto.Migration

  def change do
    create table(:job_applications) do
      add :job_id, references("jobs")

      timestamps()
    end
  end
end
