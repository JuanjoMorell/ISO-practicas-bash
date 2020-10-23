#! /bin/bash -u

usuarios=$(find $@ -type f \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%u\n" | sort | uniq)

for u in $usuarios
do
	echo "$u:"
	
	directorios=$(find $@ -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%h\n" | sort | uniq)
	for d in $directorios
	do
		echo "	$d:"
		find $d -maxdepth 1 -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "\t\t%M %f\n" | sort -k2 -t" "
	done
done

