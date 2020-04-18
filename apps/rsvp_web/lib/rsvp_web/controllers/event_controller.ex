defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  def index(conn, _params) do
    events = Rsvp.Event.all

    render(conn, "index.html", events: events)
  end

  def show(conn, %{"id" => id}) do
    event = Rsvp.Event.find(id)

    render(conn, "show.html", event: event)
  end
end
