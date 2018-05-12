defmodule Hypatia.Factories do
  use ExMachina.Ecto, repo: Hypatia.Repo
  alias Hypatia.{Job, Candidate, Fieldset, JobApplication, Field, FieldEntry}

  def job_factory(title \\ "#{Faker.Beer.name} Taster") do
    %Job{
      title: title,
      fieldset: build(:fieldset)
    }
  end

  def fieldset_factory do
    %Fieldset{
      fields: [
        build(:required_gpa_field),
        build(:optional_phone_field)
      ]
    }
  end

  def optional_phone_field_factory do
    %Field{
      name: "Phone Number",
      type: "text",
      question: "What is the best phone number to reach you?",
      required: false,
      uuid: Ecto.UUID.generate
    }
  end

  def required_gpa_field_factory do
    %Field{
      name: "GPA",
      type: "text",
      required: true,
      uuid: Ecto.UUID.generate
    }
  end

  def gpa_field_entry_factory do
    %FieldEntry{
      name: "GPA",
      type: "text",
      answer: Enum.random(1..5) |> Integer.to_string
    }
  end

  def phone_field_entry_factory do
    %FieldEntry{
      name: "Phone Number",
      type: "text",
      answer: Faker.Phone.EnUs.phone
    }
  end

  def candidate_factory do
    %Candidate{
      first_name: Faker.Name.first_name,
      last_name: Faker.Name.last_name,
      email: Faker.Internet.email
    }
  end

  def job_application_factory do
    %JobApplication{
      job: build(:job),
      candidate: build(:candidate)
    }
  end
end
