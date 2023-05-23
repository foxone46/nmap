#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
COLOR='\e[0m'
NC='\033[0m' #No color

#IP PUBLIQUE
echo -e "${GREEN}Mon IP Publique est :${COLOR}"
wget -qO- http://ipecho.net/plain | xargs echo

#IP LOCALE
echo -e "${GREEN}Mon IP Locale est :${COLOR}"
ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

#Scan du RESEAU
echo -e "${RED}Indiquer réseau avec masque${COLOR}"
echo -e "${GREEN}Exemple : 192.168.1.0/24 ${COLOR}"
read -p "Réseau:" RESEAU
echo $RESEAU
nmap -v -sn $RESEAU | grep -v down | grep Nmap | cut -d "" -f 11
nmap -v -sL $RESEAU | grep "local"

#Cible
echo -e "${RED}Indiquer cible${COLOR}"
echo -e "${GREEN}Exemple : 192.168.1.1 ${COLOR}"
read -p "Cible:" CIBLE
echo $CIBLE
nmap -T4 -v $CIBLE
