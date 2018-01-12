defmodule Hypatia.Factories do
  use ExMachina.Ecto, repo: Hypatia.Repo
  alias Hypatia.{Job, Candidate, Fieldset, JobApplication, Field}

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
