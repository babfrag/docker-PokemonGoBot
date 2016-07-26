#!/bin/bash
#
# Docker script to configure and start an PokemonGoBot
#

# see https://github.com/jabbink/PokemonGoBot/blob/develop/README.md
git clone https://github.com/jabbink/PokemonGoBot.git && cd PokemonGoBot
git submodule update --init --recursive
./gradlew build

# Last configuration file
wget https://raw.githubusercontent.com/jabbink/PokemonGoBot/master/config.properties.template -O ./config.properties

# Configuration from env
/bin/sed -i "s/username=/username=${POGO_USERNAME}/g" ./config.properties 
/bin/sed -i "s/password=/password=${POGO_PASSWORD}/g" ./config.properties
/bin/sed -i "s/latitude=/latitude=${POGO_LATITUDE}/g" ./config.properties
/bin/sed -i "s/longitude=/longitude=${POGO_LONGITUDE}/g" ./config.properties


./gradlew run


