#! /bin/bash -u

listadir="."
if test $# -gt 0
then
	bien=0
	for i in $(echo $@ | tr " " "\n")
	do
		if [  ! -d $i ]
		then
			bien=1
			break
		fi
	done	
	if test $bien -eq 1
	then
		echo "Uno de los directorios no existe" >&2
		echo "USO: $0 lista_de_directorios" >&2
		exit 1
	fi
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
		find $d -maxdepth 1 -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "\t\t%M %f\n" | sort -k2 -t" "
	done
done

