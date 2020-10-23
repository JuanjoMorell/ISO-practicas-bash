#!/bin/bash -u

echo "El numero de parámetros recibidos es $#"

menor=$1
mayor=$1

#Hacer for para obtener mayor y menor
for i in "$@"
do
	if test "$i" -lt "$menor" 
	then
		menor=$i
	elif test "$i" -gt "$mayor"
	then
		mayor=$i
	fi
done

echo "El mayor número es $mayor y el menor número es $menor" 

exit 0


