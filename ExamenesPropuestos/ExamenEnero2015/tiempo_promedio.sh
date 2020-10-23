#! /bin/bash -u

total_segundos=0
total_minutos=0
numero_procesos=$(ps aux | grep -w "^$1" | wc -l)

ps aux | tail -n +2 | grep "^$1" | tr -s " " | cut -f10 -d" " | (while read linea
do
	minutos=$(echo $linea | cut -f1 -d":")
	segundos=$(echo $linea | cut -f2 -d":")

	let total_segundos=$total_segundos+10#$segundos
	let total_minutos=$total_minutos+10#$minutos

done;

let total_segundos=$total_minutos*60+total_segundos;
let segundos_promedio=$total_segundos/$numero_procesos;
let minutos_promedio=$segundos_promedio/60;
let segundos_promedio=$segundos_promedio%60;
echo -e "\n Tiempo promedio de CPU de los procesos del usuario '$1': $minutos_promedio minutos y $segundos_promedio segundos \n"


)

