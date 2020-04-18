changeset = Rsvp.Event.changeset(%Rsvp.Event{}, %{title: "a", location: "b", description: "c", date: DateTime.utc_now})
Rsvp.Repo.insert(changeset)
