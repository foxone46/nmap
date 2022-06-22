 #!/bin/sh
 
echo -e "\e[31mLocal IP\e[0m"
/sbin/ifconfig -a
echo -e "\e[31mPublic IP\e[0m"
dig +short myip.opendns.com @resolver1.opendns.com

echo -e "\e[31mQuick Scan\e[0m"
echo -e "\e[31mRéseau à scanner\e[0m"
echo Exemple 192.168.20.255/24
read MY_NETWORK
nmap -T4 -F $MY_NETWORK

echo -e "\e[31mIntense Scan\e[0m"
echo -e "\e[31mIP à scanner\e[0m"
read MY_IP
nmap -T4 -A -v $MY_IP

# MODE EXECUTABLE
# chmod a+rx nmap.sh
# LANCEMENT
# ./nmap.sh

