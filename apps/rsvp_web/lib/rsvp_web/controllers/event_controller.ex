defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  def show(conn, _params) do
    render(conn, "show.html")
  end
end
