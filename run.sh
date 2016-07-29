#!/bin/bash
#
# Docker script to configure and start an PokemonGoBot
#

# Remove if exists (restartability)
rm -rf /PokemonGoBot

# see https://github.com/jabbink/PokemonGoBot/blob/develop/README.md
git clone https://github.com/jabbink/PokemonGoBot.git && cd PokemonGoBot
git submodule update --init --recursive
./gradlew build

# Last configuration file
wget https://raw.githubusercontent.com/jabbink/PokemonGoBot/develop/config.properties.template -O ./config.properties

# Configuration from env
for entry in `env |grep pogo_`
do
        param=`echo ${entry} | sed 's/pogo_//g' | cut -d= -f1`
        value=`echo ${entry} | sed 's/pogo_//g' | cut -d= -f2`
        /bin/sed -i "s/${param}=.*/${param}=${value}/g" ./config.properties
done

# Traffic control for niantic api patch
tc qdisc add dev eth0 root netem delay 300ms rate 56kbit

# And let's catch some of them
./gradlew run


