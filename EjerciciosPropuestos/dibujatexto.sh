#! /bin/bash -u

if test $# -ne 1
then
	echo "USO: $0 <fichero>" >&2
	exit 1
fi

if [ ! -r $1 ]
then
	echo "Imposible acceder al fichero $1" >&2
	exit 2
fi

while read linea
do
	while test -n "$linea"
	do
		repeticiones=$(echo $linea | cut -c1)
		caracter=$(echo $linea | cut -c2)
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
