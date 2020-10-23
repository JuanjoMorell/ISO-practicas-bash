#! /bin/bash -u

if test $# -ne 1
then
	echo "USO: $0 <directorio>" >&2
	exit 1
fi

if [ ! -d $1 ]
then
	echo "El directorio no existe o es inaccesible" >&2
	exit 2
fi

total_bytes=0
total_bloques=0

find $1 -maxdepth 1 -type f -printf "%s %p\n" 2>/dev/null | ( while read linea
do
	tama=$(echo $linea | cut -f1 -d" ")
	tama_bloque=$(stat -c "%b" "$(echo $linea | cut -f2 -d" ")")
	let total_bytes+=$tama
	let total_bloques+=$tama_bloque

done;
tamaBloque=$(stat -c "%B" "$1");
echo "Tamaño total en bytes: $total_bytes";
let bloques_bytes=$total_bloques*$tamaBloque
echo "Tamaño total en bloques: $total_bloques bloques de $tamaBloque bytes cada uno ($bloques_bytes bytes en total)";
echo "Eficiencia de uso: $((($total_bytes*100)/$bloques_bytes))%"
)
