defmodule Rsvp.Event do
  use Ecto.Schema

  schema "events" do
    field :title, :string
    field :location, :string
    field :date, :utc_datetime
    field :description, :string

    timestamps()
  end
end
