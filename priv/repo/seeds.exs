import Hypatia.Factories

alias Hypatia.{Repo, JobApplication, Field, FieldEntry}

jobs = Hypatia.Seeds.Jobs.create_beer_taster(10)

jobs
|> Enum.map(fn(job) ->
  Ecto.build_assoc(job, :fieldset, name: "default", fields: [
    %Field{ name: "Phone Number", question: "What is the best phone number to reach you?" type: "text", required: true },
    %Field{ name: "Cover Letter", type: "text" }
  ])
end)
|> Enum.each(fn(fieldset) -> Repo.insert!(fieldset) end)

jobs
|> Enum.each(fn(job) ->
  Repo.insert!(
    %JobApplication{
      fields: [
        %FieldEntry{ name: "Phone Number", type: "text", required: false, answer: "+19173514206" }],
      job: job,
      candidate: %Hypatia.Candidate{
        first_name: Faker.Name.first_name,
        last_name: Faker.Name.last_name,
        email: Faker.Internet.email
      }
    }
) end)
