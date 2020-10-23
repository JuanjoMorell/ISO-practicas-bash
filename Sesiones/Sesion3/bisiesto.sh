#! /bin/bash -u

bisiesto=$(cal 2 $1 | grep 29)

if test "$bisiesto" -eq "" 
then
	exit 1
else
	exit 0
fi
