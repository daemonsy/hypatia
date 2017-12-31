alias Hypatia.Repo, as: Repo

Hypatia.Seeds.Jobs.create_beer_taster(10)
  |> Enum.each(fn(job) ->
    Repo.insert!(
      %Hypatia.Job.Application{
        candidate: %Hypatia.Candidate{
          first_name: Faker.Name.first_name,
          last_name: Faker.Name.last_name,
          email: Faker.Internet.email
        }
      }
  ) end)

Repo.insert!(
  %Hypatia.Job{
    title: "Economist",
    fieldset: %Hypatia.Fieldset{
      fields: ["cover letter"] |> Enum.map(fn(field) -> %Hypatia.Field{name: field, type: "text" } end)
    }
  }
)
