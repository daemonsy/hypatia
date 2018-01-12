alias Hypatia.Repo
alias Hypatia.Field

jobs = Hypatia.Seeds.Jobs.create_beer_taster(10)

jobs
|> Enum.map(fn(job) ->
  Ecto.build_assoc(job, :fieldset, name: "default", fields: [
    %Field{ name: "phone", type: "text", required: true },
    %Field{ name: "Cover Letter", type: "text" },
    %Field{ name: "email", type: "email" } # This is wrong, not a supported type
  ])
end)
|> Enum.each(fn(fieldset) -> Repo.insert!(fieldset) end)

jobs
|> Enum.each(fn(job) ->
  Repo.insert!(
    %Hypatia.JobApplication{
      fields: [%{ phone: "12345" }],
      job: job,
      candidate: %Hypatia.Candidate{
        first_name: Faker.Name.first_name,
        last_name: Faker.Name.last_name,
        email: Faker.Internet.email
      }
    }
) end)
