#!/bin/bash -u

echo "El numero de parámetros recibidos es $#"

menor=$1
mayor=$1

for i in "$@"
do
	#Mayor y menor
	if test "$i" -lt "$menor" 
	then
		menor=$i
	elif test "$i" -gt "$mayor"
	then
		mayor=$i
	fi
done

echo "El mayor número es $mayor y el menor número es $menor" 

echo "El número más repetido es $(echo "$@" | tr " " "\n" | sort | uniq -c | sort -nr | head -1 | cut -c9 ) que aparece un total de $(echo "$@" | tr " " "\n" | sort | uniq -c | sort -nr | head -1 | cut -c7) veces"

echo "$(echo "$@" | tr " " "\n" | sort | uniq -c | sort -nr )"

exit 0


