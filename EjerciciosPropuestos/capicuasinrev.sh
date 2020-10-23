#! /bin/bash -u

enteros=$(echo "$@" | grep -o "[0-9]" | wc -l)

if test $enteros -ne 4
then
	exit 2
fi

primeracifra=$(echo "$@" | cut -c 1)
segundacifra=$(echo "$@" | cut -c 2)
terceracifra=$(echo "$@" | cut -c 3)
cuartacifra=$(echo "$@" | cut -c 4)

if test $primeracifra -eq $cuartacifra
then
	if test "$segundacifra" -eq "$terceracifra"
	then
		exit 0
	else
		exit 1
	fi
else
	exit 1
fi
