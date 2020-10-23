#! /bin/bash -u

while read linea
do
	uid=$(echo $linea | cut -f3 -d":")
	directorio=$(echo $linea | cut -f6 -d":")
	shell=$(echo $linea | cut -f7 -d":")
	usuario=$(echo $linea | cut -f1 -d":")

	if test $uid -eq 0 -o $uid -ge 1000
	then
		echo -e "$usuario \t $directorio \t $shell"
	fi

done < /etc/passwd
