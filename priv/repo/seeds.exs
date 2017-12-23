# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hypatia.Repo.insert!(%Hypatia.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Hypatia.Seeds do
  def create_beer_taster(total) do
    create_beer_taster(total, 0)
  end

  defp create_beer_taster(total, counter) when total == counter, do: true

  defp create_beer_taster(total, counter) do
    Hypatia.Repo.insert!(%Hypatia.Job{ title: "#{Faker.Beer.name} Taster", enabled: true })
    create_beer_taster(total, counter + 1)
  end
end

Hypatia.Seeds.create_beer_taster(10)

