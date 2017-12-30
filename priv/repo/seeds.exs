
Hypatia.Seeds.Jobs.create_beer_taster(10)
  |> Enum.each(fn(job) ->
    Hypatia.Repo.insert!(
      %Hypatia.Job.Application{
        candidate: %Hypatia.Candidate{
          first_name: Faker.Name.first_name,
          last_name: Faker.Name.last_name,
          email: Faker.Internet.email
        }
      }
  ) end)
