# Docker Pokemon Go Bot

Docker image to run a Pokemon Go Bot from https://github.com/jabbink/PokemonGoBot (develop)

Based on [anapsix/alpine-java:8_jdk](https://hub.docker.com/r/anapsix/alpine-java)

## Install Docker

Follow [these instructions](https://docs.docker.com/engine/installation/) to get Docker running on your server.

## Download

Get the trusted build from the [Docker Hub registry](https://hub.docker.com/r/babfrag/docker-pokemongobot):

```
docker pull babfrag/docker-pokemongobot
```

or download and compile the source yourself from GitHub:

```
git clone https://github.com/babfrag/docker-PokemonGoBot.git
cd docker-PokemonGoBot
docker build -t babfrag/docker-pokemongobot .
```

## How to use this image

### Environment variables

This Docker image uses mandatory environment variables that override the bot [config.properties](https://raw.githubusercontent.com/jabbink/PokemonGoBot/develop/config.properties.template) defaults values, that can be declared in an `env` file (see pogobot.env.example file):

```
pogo_username=<google or ptc login>
pogo_base64_password=<leave empty>
pogo_password=<google or ptc password>
pogo_latitude=<starting latitude like 1.50>
pogo_longitude=<starting longitude like 1.50>
```

You can specify any other variables to override properties using pattern :
```
pogo_<property_to_override>=<custom value>
```

Example : if you want to override transfer_cp_threshold setting, add the following env variable:
```
pogo_transfer_cp_threshold=<your custom value>
```

Start a new Docker container with the following command (replace `./pogobot.env` with your own `env` file) :

```
docker run \
    --name pogobot \
    --env-file ./pogobot.env \
    babfrag/docker-pokemongobot
```

## Author

Copyright (C) 2016 Babfrag

## [All credits to jabbink](https://github.com/jabbink/PokemonGoBot)
