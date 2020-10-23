#! /bin/bash -u

if test $# -ne 1 
then
	echo "USO: $0 <usuario>" >&2
	exit 1
fi

if ! cat /etc/passwd | grep -wq "^$1"
then
	echo "El usuario '$1' no existe" >&2
	exit 2
fi

ficheros=0
total=0

find /home/$1 -type f -printf "%s\n" 2>/dev/null | ( while read tama
do
	let ficheros+=1
	let total+=$tama
done;
echo "Ficheros regulares: $ficheros. Tamaño total: $total bytes"
)

echo "Los siguientes ficheros regulares no pertenecen a $1:"
find /home/$1 -type f ! -user $1 -printf "%p\n"
