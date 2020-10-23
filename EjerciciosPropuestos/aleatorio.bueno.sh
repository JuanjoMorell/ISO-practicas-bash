#! /bin/bash -u

while true
do
	numero=$(($RANDOM%100+1))

	coincidencia=0
	for i in $(seq 1 1 $#)
	do
		if test $numero -eq ${!i}
		then
			coincidencia=1
			break
		fi
	done

	if test $coincidencia -eq 1
	then
		numero=$(($RANDOM%100+1))
	else
		break
	fi
done

echo "Numero aleatrio entre 1 y 100 (eliminando los argumentos): $numero"
