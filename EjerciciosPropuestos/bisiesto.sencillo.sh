#! /bin/bash -u

if cal 2 $1 | grep -q 29
then
	exit 0
else
	exit 1
fi
