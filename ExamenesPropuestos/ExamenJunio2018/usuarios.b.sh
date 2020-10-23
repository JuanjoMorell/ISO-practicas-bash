#! /bin/bash -u

while read linea
do
	uid=$(echo $linea | cut -f3 -d":")
	directorio=$(echo $linea | cut -f6 -d":")
	shell=$(echo $linea | cut -f7 -d":")
	usuario=$(echo $linea | cut -f1 -d":")

	if test $uid -eq 0 -o $uid -ge 1000
	then
		if [ -d "$directorio" ]
		then
			primerdirectorio=$(echo $directorio | cut -d"/" -f2)
			if [ "$primerdirectorio" == "home" ]
			then
				echo -e "$usuario \t $directorio \t $shell"
			fi
		fi
	fi

done < /etc/passwd
