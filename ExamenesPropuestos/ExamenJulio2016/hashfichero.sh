#! /bin/bash -u

if test $# -ne 2 
then
	echo "se necesitan dos parametros." >&2
	echo "USO: $0 fichero tamaño_de_bloque" >&2
	exit 1
fi

if [ ! -f $1 ]
then
	echo "El fichero no existe." >&2
	echo "USO: $0 fichero tamaño_de_bloque" >&2
	exit 2
fi

if ! echo $2 | grep -qx "[0-9]\+"
then
	echo "El tamaño tiene que ser un número." >&2
	echo "USO: $0 fichero tamaño_de_bloque" >&2
	exit 3
fi


