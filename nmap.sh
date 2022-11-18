#!/bin/bash
GREEN='\033[0;32m'
RED='\033[0;31m'
COLOR='\e[0m'
NC='\033[0m' #No color
RESEAU=$1

#IP PUBLIQUE
echo -e "${GREEN}Mon IP Publique est :${COLOR}"
wget http://ipecho.net/plain -O - -q;echo

#RESEAU
echo -e "${RED}Scan du réseau${COLOR}"
#read $RESEAU
scan1(){
        echo "ma fonction"
        echo $RESEAU
        nmap -T4 -F $RESEAU
}
scan1

#IP
echo -e "${RED}Quel IP?Exemple 192.168.2.11${COLOR}"
read $IP
scan2(){
nmap -T4 -v $IP
}
scan2
