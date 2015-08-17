# Postgres-kiwi

This Macos-targeted dockerfile builds the latest postgres and initializes the kiwiprints database.

# Notes on using this dockerfile

## Install and run the first time

Start the boot2docker app, which opens a terminal. In this terminal, cd to this source code directory.

### Build

docker build --no-cache -t chrisekelley/postgres-kiwi .

## Once the container has been installed, here is how you run it:

Start the boot2docker app, which opens a terminal. (If you just built it, you don't need to do this.)

In another terminal run

boot2docker ssh

docker run -t -i -e DB_NAME=kiwiprints -e DB_USER=kiwiprints -e DB_PASS=kiwiprints -d -p 5432:5432 chrisekelley/postgres-kiwi

This will run the container in the background and return its id.

## Access via postgres

Use boot2docker to get the ip address. Then use it to connect using your local sql:
psql -h 192.168.59.103 -p 5432 -d kiwiprints -U kiwiprints --password

### Other Run commands

docker run --name postgres-kiwi -e DB_NAME=kiwiprints -e DB_USER=kiwiprints -e DB_PASS=kiwiprints -d -p 5432:5432 chrisekelley/postgres-kiwi 

docker run -it --link chrisekelley/postgres-kiwi:chrisekelley/postgres-kiwi sh -c 'exec psql -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" -U postgres'

## To run and view logs

To run the image and view the log:
docker run -i chrisekelley/postgres-kiwi

## To view current docker containers

docker ps

## To delete an image

docker rmi chrisekelley/postgres-kiwi

## To delete a container

docker rm chrisekelley/postgres-kiwi

## Docker docs

https://docs.docker.com/userguide/usingdocker/
https://docs.docker.com/userguide/dockerimages/



