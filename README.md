# Postgres-kiwi

This Macos-targeted dockerfile builds the latest postgres and initializes the kiwiprints database.

# Notes on using this dockerfile

## Install and run the first time

### Build

docker build --no-cache -t chrisekelley/postgres-kiwi .

### Run

docker run --name postgres-kiwi -e DB_NAME=kiwiprints -e DB_USER=kiwiprints -e DB_PASS=kiwiprints -d -p 5432:5432 chrisekelley/postgres-kiwi 

docker run -it --link chrisekelley/postgres-kiwi:chrisekelley/postgres-kiwi sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

## Once the ocntainer has been installed, here is how you run it:

Start the boot2docker app, which opens a terminal.

In another terminal run

boot2docker ssh

docker run -t -i -e DB_NAME=kiwiprints -e DB_USER=kiwiprints -e DB_PASS=kiwiprints -d -p 5432:5432 chrisekelley/postgres-kiwi

## Access via postgres

Use boot2docker to get the ip address. Then use it to connect using your local sql:
psql -h 192.168.59.103 -p 5432 -d kiwiprints -U postgres --password

## To run and view logs

To run the image and view the log:
docker run -i chrisekelley/postgres-kiwi

## To view current docker containers

docker ps

