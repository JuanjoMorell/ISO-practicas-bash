#! /bin/bash -u

if test $# -ne 1
then
	echo "Uso: $0 fichero" 1>&2
	exit 1
fi

if [ ! -r $1 ]
then
	echo "El fichero $1 no existe o no se puede leer" 1>&2
	exit 2
fi


