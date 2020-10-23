#! /bin/bash -u

usuarios=$(find $@ -type f \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%u\n" | sort | uniq)

for u in $usuarios
do
	echo "$u:"
	
	find $@ -type f -user $u \( ! -perm -100 -a -perm /011 -o ! -perm -400 \) -printf "%p %M\n"


done

