#!/bin/bash
# docker entrypoint script.

# wait until Postgres is ready
# while ! pg_isready -q -d $DATABASE_URL
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

bin="/app/bin/acortador_umbrella"

# migrate the database
echo "starting Migrations"
eval "$bin eval \"Acortador.Release.migrate\""

# start the elixir application
echo "starting Acortador"
exec "$bin" "start"
