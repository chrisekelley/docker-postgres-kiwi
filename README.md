# Postgres-kiwi

This dockerfile builds the latest postgres and initializes the kiwiprints database.

# Notes on using this dockerfile

## Build

docker build --no-cache -t chrisekelley/postgres-kiwi .

## Run

docker run --name postgres-kiwi -e DB_NAME=kiwiprints -e DB_USER=kiwiprints -e DB_PASS=kiwiprints -d -p 5432:5432 chrisekelley/postgres-kiwi 

docker run -it --link chrisekelley/postgres-kiwi:chrisekelley/postgres-kiwi sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

## Access via postgres

Use boot2docker to get the ip address. Then use it to connect using your local sql:
psql -h 192.168.59.103 -p 5432 -d kiwiprints -U postgres --password

## Logs

To run and view the log:
docker run -i chrisekelley/postgres-kiwi

