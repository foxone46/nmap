#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
COLOR='\e[0m'
NC='\033[0m' #No color
RESEAU=$1

#IP PUBLIQUE
#echo -e "${GREEN}Mon IP Publique est :${COLOR}"
#wget [http://ipecho.net/plain](http://ipecho.net/plain) -O - -q;echo

#IP LOCALE
echo -e "${GREEN}Mon IP Locale est :${COLOR}"
#ip a | grep "inet " | grep -v 127.0.0.1
ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'

#Scan du RESEAU
echo -e "${RED}Indiquer réseau avec masque${COLOR}"
echo -e "${GREEN}Exemple : 192.168.1.0/24 ${COLOR}"
read -p "Réseau:" RESEAU
echo $RESEAU
nmap -v -sn 192.168.100.0/24 | grep -v down | grep Nmap | cut -d "" -f 11
nmap -v -sL $RESEAU | grep "local"
