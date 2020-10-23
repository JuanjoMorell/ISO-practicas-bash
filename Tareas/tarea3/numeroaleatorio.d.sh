#! /bin/bash -u

parametros="$(echo "$@" | tr " " "\n" | wc -l)"
naturales="$(echo "$@" | tr " " "\n" | grep -c "^[0-9]*$")"
let rangoin=$1*2
let rangosup=$1*7

if test "$#" -ne 2
then
	echo "Error: Número de argumentos incorrecto"
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 1
fi

if test "$naturales" -ne 2
then
	echo "Error: Alguno de los argumentos (o ambos) no es número natural."
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 2
fi
 
if test "$1" -lt 2 -o "$1" -gt 10
then
	echo "Error: El primer argumento debe ser un número natural entre 2 y 10 (ambos inclusive)." 1>&2
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 3
fi

if test "$2" -lt "$rangoin" -o "$2" -gt "$rangosup"
then
	echo "Error: El valor de la suma con $1 cifras debe estar comprendido entre $rangoin y $rangosup."
	echo "Uso: numeroaleatorio.a.sh cifras suma"
	exit 4
fi

echo -n "El número aleatorio de $1 cifras, las cuales suman $2: "
resto=$2

for i in $(seq 1 1 "$1")
do
	numero=$(($RANDOM%9))
	
	if test $resto -lt 10
	then
		if test $i -eq "$1"
		then
			echo -n "$resto"
		else
			numero=$(($RANDOM%$resto))
			let resto=$resto-$numero
			echo -n "$numero"
		fi
	else
		numero=$(($RANDOM%9))
		let resto=$resto-$numero
		echo -n "$numero"	
	fi	

done
echo "."
exit 0

