#!/bin/bash -u

if [ "$#" != 0 ]
then
	echo "El guión shell num_arg ha recibido $# argumentos"
	for i in $@
	do
		echo "argumento $i: ${!i}"	
	done
	
	exit 0
else
	echo "El guión shell num_arg no ha recibido ningún argumentos"
	exit 1
fi
