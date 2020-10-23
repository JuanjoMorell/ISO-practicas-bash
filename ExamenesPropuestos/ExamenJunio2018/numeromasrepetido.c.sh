#! /bin/bash -u

if test $# -ne 1
then
	echo "USO: $0 fichero" >&2
	exit 1
fi

if [ ! -f $1 ]
then
	echo "USO: $0 fichero" >&2
	exit 2
fi

numeros=$(cat $1 | grep -o "[0-9]\+" | sort | uniq)
echo
echo "Los $(echo $numeros | tr " " "\n" | wc -l) que aparecen en el fichero '$1' son: $(echo $numeros | tr " " ",")"

masrepetido=$(cat $1 | grep -o "[0-9]\+" | sort | uniq -c | sort -k1nr)

num_frec=$(echo $masrepetido | head -n 1 | cut -f1 -d" ")
num_veces=$(echo $masrepetido | head -n 1 | cut -f2 -d" ")
echo
echo "El numero mas frecuente es el $num_veces, que aparece un total de $num_frec veces"
