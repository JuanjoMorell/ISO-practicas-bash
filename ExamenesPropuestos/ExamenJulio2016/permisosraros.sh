#! /bin/bash

listadir="."
if test $# -gt 0
then
	listadir=$@
fi

usuarios=$(find $listadir -type f \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%u\n" | sort | uniq)

for u in $usuarios
do
	echo "$u:"
	directorios=$(find $listadir -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%h\n" | sort | uniq)
	for d in $directorios
	do
		echo "	$d:"
		ficheros=$(find "$d" -maxdepth 1 -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%p\n")
		for f in $ficheros
		do
			nombre=$(basename "$f")
			permisos=$(ls -l "$f" | tr -s " " | cut -f1 -d" ")
			echo "	$permisos $nombre"
		done
	done
done
