#! /bin/bash -u

if test $# -ne 0
then
	comprobar=1
	while test $comprobar -ne 0
	do
		numero=$(($RANDOM%100+1))
		igual=0
		for i in $(seq 1 1 $#)
		do
			if test $numero -eq $i
			then
				igual=1
			fi
		done
		if test $igual -eq 0
		then
			comprobar=0
		fi	
	done
	echo "Número aleatorio entre 1 y 100 (eliminando los argumentos) : $numero"
else
	echo $(($RANDOM%100))
fi
