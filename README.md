# Docker Pokemon Go Bot

Docker image to run a Pokemon Go Bot from https://github.com/jabbink/PokemonGoBot (develop)

Based on [anapsix/alpine-java:8_jdk](https://hub.docker.com/r/anapsix/alpine-java)

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

This Docker image uses the following four environment variables, that can be declared in an `env` file (see pogobot.env.example file):

```
POGO_USERNAME=<google or ptc login>
POGO_PASSWORD=<google or ptc password>
POGO_LATITUDE=<starting latitude>
POGO_LONGITUDE=<starting longitude>
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

## Bot itself
[the work of jabbink](https://github.com/jabbink/PokemonGoBot)
