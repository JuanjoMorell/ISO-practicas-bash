#! /bin/bash -u

i=0

cat $1 | (while read linea
do
	
	let i=$i+1
	echo "Línea $i: $linea"

done;

echo "Total de líneas: $i")
