#! /bin/bash -u

echo "El número de parámetros recibido es $#"

mayor=$(echo "$@" | tr " " "\n" | sort -nr | head -n 1)
menor=$(echo "$@" | tr " " "\n" | sort -nr | tail -n 1)
echo "El número mayor es $mayor y el número menor es $menor"

Nrepetido=$(echo "$@" | tr " " "\n" | sort -n | uniq -c | tr -s " " | sort -k2nr,2 -k3n -t" " | head -n 1 | cut -f2 -d" ")
repetido=$(echo "$@" | tr " " "\n" | sort -n | uniq -c | tr -s " " | sort -k2nr,2 -k3n -t" " | head -n 1 | cut -f3 -d" ")
echo "El número más repetido es $repetido que aparece un total de $Nrepetido veces"

exit 0
