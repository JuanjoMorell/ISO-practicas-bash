#! /bin/bash -u

if test $# -ne 1
then
	echo "USO: $0 directorio" >&2
	exit 1
fi

if [ ! -d $1 ]
then
	echo "$1 no es un directorio" >&2
	exit 2
fi

echo -e "PERMISOS\tTAMAÑO\tACUMULADO\tNOMBRE"

acumulado=0
ls -l | tail -n +2 | tr -s " " | cut -f1,5,9 -d" " | while read linea
do
	permisos=$(echo $linea | cut -f1 -d" ")
	tamano=$(echo $linea | cut -f2 -d" ")
	nombre=$(echo $linea | cut -f3 -d" ")

	let acumulado+=$tamano

	echo -e "$permisos\t$tamano\t$acumulado\t\t$nombre"
done
