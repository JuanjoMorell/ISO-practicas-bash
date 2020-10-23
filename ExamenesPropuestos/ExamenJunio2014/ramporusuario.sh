#! /bin/bash -u

ps aux | tail -n +2 | tr -s " " | cut -f1 -d" " | sort | uniq |  while read usuario
do
	total=0
	ps aux | tail -n +2 | grep -w "^$usuario" | tr -s " " | cut -f6 -d" " | ( while read tama
	do
		let total+=$tama
	done;
	echo "$usuario: $total"
	)
done | column -t
