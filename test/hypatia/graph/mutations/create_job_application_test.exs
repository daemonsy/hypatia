defmodule Hypatia.CreateJobApplicationTest do
  use ExUnit.Case
  use HypatiaWeb.ConnCase
  import Hypatia.Factories

  alias Hypatia.JobApplication

  setup do
    required_gpa_field = build(:required_gpa_field)
    optional_phone_field = build(:optional_phone_field)

    job = build(:job, fieldset:
      build(:fieldset, fields: [
        required_gpa_field,
        optional_phone_field
      ]
    ))

    {:ok,
      job: insert(job),
      candidate: insert(:candidate),
      fields: [required_gpa_field: required_gpa_field, optional_phone_field: optional_phone_field],
      query: """
        mutation createJobApplication($jobId: ID!, $candidateId: ID!, $fields: Json) {
          createJobApplication(jobId: $jobId, candidateId: $candidateId, fields: $fields) {
            id
            fields
          }
        }
      """}
  end

  test "Creates a job application given valid fields ", %{ job: job, candidate: candidate, query: query, fields: fields } = context do
    {:ok, _} = Absinthe.run(query, Hypatia.Graph.Schema,
      variables: %{
        "jobId" => job.id,
        "candidateId" => candidate.id,
        "fields" => Poison.encode!(%{
          fields[:optional_phone_field].uuid => "+19179032036",
          fields[:required_gpa_field].uuid => "3.5" })
      })
  end
end
