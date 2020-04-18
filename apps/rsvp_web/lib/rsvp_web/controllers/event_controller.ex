defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  def show(conn, %{"id" => id}) do
    event = Rsvp.Event.find(id)

    render(conn, "show.html", event: event)
  end
end
