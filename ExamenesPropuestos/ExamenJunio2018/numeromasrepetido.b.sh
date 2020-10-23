#! /bin/bash -u

if test $# -ne 1
then
	echo "USO: $0 fichero" >&2
	exit 1
fi

if [ ! -f $1 ]
then
	echo "USO: $0 fichero" >&2
	exit 2
fi

cat $1 | grep -o "[0-9]\+" | sort | uniq -c | sort -k1nr
