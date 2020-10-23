#!/bin/bash -u

echo "El numero de parámetros recibidos es $#"

menor=$1
mayor=$1
noentero=0
sinsigno=0

for i in "$@"
do
	check="$(echo "$i" | grep -E "^[0-9]*$")"
	if [ "$check" != '' ]
	then
        	let aux=$sinsigno+1
		sinsigno=$aux
		#Mayor y menor
        	if test "$i" -lt "$menor"
        	then
                	menor=$i
        	elif test "$i" -gt "$mayor"
        	then
        	       	mayor=$i
	        fi
	else 
		noentero=1	
	fi
done

echo "El número de enteros sin signo recibidos es $sinsigno"

echo "El mayor número es $mayor y el menor número es $menor" 

echo "El número más repetido es $(echo "$@" | tr " " "\n" | sort | uniq -c | sort -nr | head -1 | cut -c9 ) que aparece un total de $(echo "$@" | tr " " "\n" | sort | uniq -c | sort -nr | head -1 | cut -c7) veces"

if [ "$noentero" == 1 ]
then
	exit 1
else
	exit 0
fi

