defmodule Rsvp.Event do
  use Ecto.Schema

  schema "events" do
    field(:title, :string)
    field(:location, :string)
    field(:description, :string)
    field(:date, :utc_datetime)

    timestamps()
  end

  @required_fields [:title, :location, :date]
  @optional_fields [:description]

  def find(id) do
    Rsvp.Event |> Rsvp.Repo.get(id)
  end

  def all do
    Rsvp.Event |> Rsvp.Repo.all()
  end

  def changeset(event, params \\ %{}) do
    event
    |> Ecto.Changeset.cast(params, @required_fields ++ @optional_fields)
    |> Ecto.Changeset.validate_required(@required_fields)
    |> Ecto.Changeset.validate_change(:date, &must_be_future/2)
  end

  defp must_be_future(_, value) do
    DateTime.compare(value, DateTime.utc_now())
    |> get_error
  end

  defp get_error(comparison) when comparison == :lt do
    [date: "Cannot be in the past"]
  end

  defp get_error(_) do
  end

  def demo_crud do
    # Create
    event = %Rsvp.Event{}

    changeset =
      Rsvp.Event.changeset(event, %{
        title: "a",
        location: "b",
        description: "c",
        date: DateTime.utc_now()
      })

    # invalid_changeset = Rsvp.Event.changeset(event, %{title: "a", location: "b", description: "c", date: DateTime.utc_now |> DateTime.add(-60, :second)})
    {:ok, event} = Rsvp.Repo.insert(changeset)

    # Update
    changeset = Rsvp.Event.changeset(event, %{title: "New title"})
    Rsvp.Repo.update(changeset)

    # Query
    Rsvp.Event |> Rsvp.Repo.all()
    # => Rsvp.Repo.get(Rsvp.Event, 1)
    Rsvp.Event |> Rsvp.Repo.get(1)

    # Delete
    event = Rsvp.Event |> Rsvp.Repo.get(1)
    Rsvp.Repo.delete(event)
  end
end
