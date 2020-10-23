#! /bin/bash -u

dia=$(cal 2 $1 | tail -n +3 | tr " " "\n" | grep -c "^[0-9]\+$")

if test $dia -eq 29
then
	exit 0
else
	exit 1
fi
