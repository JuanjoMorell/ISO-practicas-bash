#! /bin/bash -u

echo "El número de parámetros recibido es $#"

mayor=$(echo "$@" | tr " " "\n" | sort -nr | head -n 1)
menor=$(echo "$@" | tr " " "\n" | sort -nr | tail -n 1)
echo "El número mayor es $mayor y el número menor es $menor"

exit 0
