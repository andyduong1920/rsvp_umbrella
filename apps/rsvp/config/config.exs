use Mix.Config

config :rsvp, Rsvp.Repo,
  database: "rsvp",
  username: "postgres",
  hostname: "localhost"

config :rsvp, ecto_repos: [Rsvp.Repo]
