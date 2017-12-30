defmodule Hypatia.Seeds.Jobs do
  def create_beer_taster(total) do
    create_beer_taster(total, 0, [])
  end

  defp create_beer_taster(total, counter, accum) when total == counter, do: accum

  defp create_beer_taster(total, counter, accum) do
    create_beer_taster(total, counter + 1, [
      Hypatia.Repo.insert!(%Hypatia.Job{ title: "#{Faker.Beer.name} Taster" }) | accum])
  end
end
