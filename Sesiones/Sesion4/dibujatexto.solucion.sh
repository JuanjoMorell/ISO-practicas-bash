#! /bin/bash -u

test $# -ne 1 && echo "Uso: $0 <fichero>" 1>&2 && exit 1

if test ! -f $1 -o ! -r $1 #Comprobamos si es un fichero y tenemos permiso de lectura
then
	echo "Imposible acceder al fichero $1" 1>&2
	exit 2
fi

while read linea
do

	while test -n "$linea"
	do
		caracter=$(echo $linea | cut -c2)
		repeticiones=$(echo $linea | cut -c1)
		for i in $(seq 1 1 $repeticiones)
		do
			echo -n "$caracter"
		done

		if [ ${#linea} -eq 2 ]
		then
			linea=""
		else
			linea=$(echo $linea | cut -c3-${#linea})
		fi
	done
	echo
done < $1


