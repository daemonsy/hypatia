defmodule Hypatia.Repo.Migrations.AddCandiatesIdToApplications do
  use Ecto.Migration

  def change do
    alter table("job_applications") do
      add :candidate_id, references("candidates")
    end
  end
end
