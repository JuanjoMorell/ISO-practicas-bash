#! /bin/bash -u

if test $# -ne 1
then
	echo "Uso: $0 <fichero>" 1>&2
	exit 1
fi

if [ ! -d $1 ]
then
	echo "Imposible acceder al fichero $1" 1>&2
	exit 2
fi

while read linea
do
	letras=$(echo -n $linea | wc -c)
      	for i in $(seq 1 1 $letras)
	do
		if echo $i | grep -o "^[0-9]\+$"
		then
			numero=$i
		elif echo $i | grep "^\*$"
		then
			caracter=$i
		else
			caracter=" "
		fi
	done	
	
	
done < $1
