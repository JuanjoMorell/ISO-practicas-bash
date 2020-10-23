#! /bin/bash -u

i=0

while read linea
do
	
	let i=$i+1
	echo "Línea $i: $linea"

done < $1

echo "Total de líneas: $i"
