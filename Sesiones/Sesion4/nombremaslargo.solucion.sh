#! /bin/bash -u

nombremaslargo=""
listaficheros=""

# f -> nombre del fichero, no la ruta
find "$@" -type f -printf "%f %p\n" | ( while read linea
do
	#Si el espacio da porblemas usar : como delimitador
	nombrefichero=$(echo "$linea" | cut -f1 -d" ")
	if test ${#nombremaslargo} -lt ${#nombrefichero}
	then
		nombremaslargo=$nombrefichero
		listaficheros=$(echo "$linea" | cut -f2 -d" ")
	elif test ${#nombremaslargo} -eq ${#nombrefichero}
	then
		listaficheros=$listaficheros $(echo "$linea" | cut -f2 -d" ")
	fi
done

echo "$listaficheros" | tr " " "\n" )
