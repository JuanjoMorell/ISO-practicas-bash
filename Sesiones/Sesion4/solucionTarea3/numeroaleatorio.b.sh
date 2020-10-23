#! /bin/bash -u

if test $# -ne 2
then
	echo "Error: Número de argumentos incorrecto." 1>&2
	echo "Uso: $0 cifras suma" 1>&2
	exit 1
fi

if ! echo $1 | grep -qx "[[:digit:]]\+" || ! echo $2 | grep -qx "[[:digit:]]\+"
then
	echo "Error: Algunos de los argumentos (o ambos) no es un numero natural" 1>&2
	echo "Uso: $0 cifras suma" 1>&2
	exit 2
fi

#Se puede hacer un if
#Con lista de ordenes:
test $1 -lt 2 -o $1 -gt 10 && echo "Error: El primer argumento debe ser un numero natural entre 2 y 10 (ambos inclusive)" 1>&2 && echo "Uso: $0 cifras suma" 1>&2 && exit 3


numero=$(echo $RANDOM | cut -c1)
while test $numero -eq 0
do
	numero=$(echo $RANDOM | cut -c1)
done

for i in $(seq 1 1 $(($1-1)))
do
	cifra=$(echo $RANDOM | cut -c1)
	numero=$numero$cifra #concatenamos cifras
done

echo "Número aleatorio de $1 cifras: $numero"








