defmodule Hypatia.JobApplicationTest do
  use ExUnit.Case
  import Hypatia.JobApplication

  setup_all do
    {:ok, fields: [
      %{ name: :name, type: :string, required: true },
      %{ name: :date_of_birth, type: :date, required: false }
    ]}
  end

  test "data_changeset casts data based on :type", %{ fields: fields } = context do
    data = %{ name: "Lily Rabe", date_of_birth: "1982-06-29" }

    changes = %{ date_of_birth: "1999-05-06" }

    assert data_changeset(data, changes, fields).valid? == true
  end

  test "data_changeset validates required data based on :required", %{ fields: fields } = context do
    data = %{}
    changes = %{ name: "Samantha Carter" }

    assert data_changeset(data, changes, fields).valid? == true
    assert data_changeset(data, %{}, fields).valid? == false
  end
end
