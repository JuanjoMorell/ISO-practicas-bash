#! /bin/bash -u

parametros="$(echo "$@" | tr " " "\n" | wc -l)"
naturales="$(echo "$@" | tr " " "\n" | grep -c "^[0-9]*$")"

if test "$#" -ne 2
then
	echo "Error: Número de argumentos incorrecto"
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 1
fi

if test "$naturales" -ne 2
then
	echo "Error: Alguno de los argumentos (o ambos) no es número natural."
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 2
fi
 
if test "$1" -lt 2 -o "$1" -gt 10
then
	echo "Error: El primer argumento debe ser un número natural entre 2 y 10 (ambos inclusive)." 1>&2
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 3
fi

