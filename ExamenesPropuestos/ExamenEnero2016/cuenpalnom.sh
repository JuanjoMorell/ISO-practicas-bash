#! /bin/bash -u

if test $# -ne 2
then
	echo "Uso: $0 fichero_de_palabras directorio" >&2
	exit 1
fi

if [ ! -f "$1" -o ! -d "$2" ]
then
	echo "Uso: $0 fichero_de_palabras directorio" >&2
	exit 1
fi

cat $1 | tr "[:upper:]" "[:lower:]" | tr -c "[a-z0-9] " " "  | tr -s " " "\n" | sort | uniq |
	while read linea
	do
		numero=$(find "$2" -type f -name "*$linea*" | wc -l)
		if [ $numero -ne 0 ]
		then
			echo -e "$linea\t$numero"
		fi
	done
