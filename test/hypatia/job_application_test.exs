defmodule Hypatia.JobApplicationTest do
  use ExUnit.Case
  import Hypatia.JobApplication

  setup_all do
    {:ok, fields: [
      %{ name: :name, type: :string, required: true },
      %{ name: :date_of_birth, type: :date, required: false }
    ]}
  end
end
