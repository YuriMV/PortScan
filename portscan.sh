#!/usr/bin/env bash
#coded by vold
#TFaction s2
COUNT=0
VERMELHO='\e[0;31m'
SEMCOR='\e[0m'
VERDE='\e[0;32m'
PMAX=1000
 read -p "host: " h
for (( COUNT=21;COUNT<$PMAX;COUNT++ ))
do
t=`nc -z -v $h $COUNT -w 1 2>&1 | sed 's/\s.*$//'`
 if [ "$t" = "Connection" ]
then
  printf "${VERDE}[+]Connected to the port: $COUNT\n${SEMCOR}"
elif [ "$t" = "nc:" ]
 then
 printf "${VERMELHO}[-]Connection failure on port: $COUNT\n${SEMCOR}"
  else
 echo '...'
 fi
done

 
