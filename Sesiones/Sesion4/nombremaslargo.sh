#! /bin/bash -u

if test $# -lt 1
then
	echo "Error: Debe haber al menos un directorio" 1>&2
	echo "Uso: $0 <directorios>" 1>&2
	exit 1
fi

directorios=0
for i in $(seq 1 1 $#)
do
	if [ ! -d ${!i} ]
	then
		directorios=1
	fi
done

if test $directorios -eq 1
then 
	echo "Error: Alguno de los parametros no es un directorio" 1>&2
	echo "Uso: $0 <directorios>" 1>&2
	exit 2
fi

for i in $(seq 1 1 $#)
do
	maslargo=""
	for fic in ${!i}*
	do
		if test ${#fic} -gt ${#maslargo} -a -f $fic
		then
			maslargo=$fic
		fi
	done
	if test -n $maslargo
	then
      	      echo $maslargo
        fi
done


