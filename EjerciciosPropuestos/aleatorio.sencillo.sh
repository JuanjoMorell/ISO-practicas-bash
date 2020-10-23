#! /bin/bash -u

if test $# -eq 0
then
	echo $(($RANDOM%100+1))
	exit 0
fi

aleatorio=$(($RANDOM%100+1))

while echo "$@" | tr " " "\n" | grep -q "$aleatorio"
do
	aleatorio=$(($RANDOM%100+1))
done

echo "Numero aleatorio entre 1 y 100 (eliminado los argumentos) : $aleatorio"
