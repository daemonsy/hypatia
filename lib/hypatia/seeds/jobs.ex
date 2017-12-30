defmodule Hypatia.Seeds.Jobs do
  def create_beer_taster(total) do
    create_beer_taster(total, 0)
  end

  defp create_beer_taster(total, counter) when total == counter, do: true

  defp create_beer_taster(total, counter) do
    Hypatia.Repo.insert!(%Hypatia.Job{ title: "#{Faker.Beer.name} Taster" })
    create_beer_taster(total, counter + 1)
  end
end
