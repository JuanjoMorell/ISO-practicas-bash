#! /bin/bash -u

test $# -ne 3 && echo "USO: $0 fichero vieja_palabra nueva_palabra" >&2 && exit 1

if [ ! -r "$1" ]
then
	echo "El fichero '$1' no existe o no se puede leer"
	exit 2
fi

temporal=$(mktemp)

fichero=""

while read linea
do
	echo $linea | grep -wo "[[:alpha:]]\+" |( while read palabra
	do
		if [ "$palabra" == "$2" ]
		then
			fichero=$fichero$(echo -n "$3 ")
		else
			fichero=$fichero$(echo -n "$palabra ")
		fi
	done;
	fichero=$fichero$(echo);
	echo $fichero >> $temporal
	)
done < "$1"

mv $temporal $1
