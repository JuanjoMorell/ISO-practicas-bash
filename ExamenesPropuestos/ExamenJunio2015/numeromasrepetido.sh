#! /bin/bash -u

if test $# -ne 1
then 
	echo "USO: $0 fichero" >&2
	exit 1
fi

if [ ! -f $1 ]
then
	echo "El fichero no existe." >&2
	echo "USO: $0 fichero" >&2
	exit 2
fi

masrepe=$(cat $1 | grep -o "[0-9]\+" | sort | uniq -c | tr -s " " | sort -k1,1nr | head -n 1 | cut -f3 -d" ")
numero=$(cat $1 | grep -o "[0-9]\+" | sort | uniq -c | tr -s " " | sort -k1,1nr | head -n 1 | cut -f2 -d" ")

echo "El número mas frecuente es el $masrepe, que sale un total de $numero veces."
