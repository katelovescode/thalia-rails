# README

Local dev:

```
docker compose build
docker compose run --rm web bundle exec rails db:prepare
docker compose up
```

New gems/dependencies/configuration at the app root?

```
docker compose down
docker compose build
docker compose run --rm web bundle install
docker compose up
```

New migrations?

```
docker compose run --rm web bundle exec rails db:migrate
```

OR

```
docker compose exec web bundle exec rails db:migrate
```

Thalia Test lives on my test Discord server, "Ping!" her to confirm she's up

Production is down for now

Troubleshooting:

- delete all images/volumes/containers/networks/build artifacts (convenience methods: `dbb` and `dpru` for my local environment)
