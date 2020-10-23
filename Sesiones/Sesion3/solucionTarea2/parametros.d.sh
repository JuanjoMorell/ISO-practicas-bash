#! /bin/bash -u

echo "El número de parámetros recibido es $#"

sinsigno=$(echo "$@" | tr " " "\n" | grep -x "[[:digit:]]\+")
echo "El número de enteros sin signo recibidos es $(echo "$sinsigno" | wc -l)"

mayor=$(echo "$sinsigno" | sort -nr | head -n 1)
menor=$(echo "$sinsigno" | sort -nr | tail -n 1)
echo "El número mayor es $mayor y el número menor es $menor"

Nrepetido=$(echo "$sinsigno" | sort -n | uniq -c | tr -s " " | sort -k2nr,2 -k3n -t" " | head -n 1 | cut -f2 -d" ")
repetido=$(echo "$sinsigno" | sort -n | uniq -c | tr -s " " | sort -k2nr,2 -k3n -t" " | head -n 1 | cut -f3 -d" ")
echo "El número más repetido es $repetido que aparece un total de $Nrepetido veces"

let codigo=$(echo "$sinsigno" | wc -l)!=$#
#Devuelve 1 si se cumple la condicion, 0 si no
#Tambien se puede hacer con un if/else
exit $codigo
