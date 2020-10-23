#! /bin/bash -u

if [ ! -f $1 ]
then
	echo "El fichero no existe. USO: $0 fichero" >&2
	exit 1
fi

tempOrig=$(mktemp)
tempDest=$(mktemp)
cp "$1" $tempOrig
lineas=$(wc -l $tempOrig | cut -f1 -d" ")
while [ $lineas -gt 0 ]
do
	quitar=$(($RANDOM % $lineas + 1))
	cat $tempOrig | head -n $quitar | tail -n 1
	cat $tempOrig | head -n $((quitar-1)) > $tempDest
	cat $tempOrig | tail -n $((lineas-quitar)) >> $tempDest
	cp $tempDest $tempOrig
	let lineas=$lineas-1
done
rm $tempOrig
rm $tempDest

