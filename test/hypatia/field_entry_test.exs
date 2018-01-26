defmodule Hypatia.FieldEntryTest do
  use ExUnit.Case, async: true
  alias Hypatia.FieldEntry

  test "Field entry requires name, type and required" do
    entry = FieldEntry.changeset(%FieldEntry{}, %{ name: "GPA", type: "text", required: false })

    assert entry.valid? == true
  end

  test "Field entry that is required but has no answer is invalid" do
    entry = FieldEntry.changeset(%FieldEntry{}, %{ required: true, name: "Name", type: "text" })

    assert entry.valid? == false
  end
end
