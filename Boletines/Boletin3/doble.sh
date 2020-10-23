#!/bin/bash -u

final=0

while let $final -gt 0
do
	echo "Introduzca un numero:"
	read numero

	if [ "$numero" -ge 100  -a "$numero" -le 200  ]
	then
		let respuesta=$numero*2
		echo "El doble de $numero es $respuesta\n"
		echo "¿Desea calcular otro doble (S/N)?"
		read seguir
		if ["$seguir" == "N"]
		then
			exit 0
			final=1
		fi
	else
		echo "El numero no esta entre 100 y 200"
		exit 1
		final=1
	fi
done
