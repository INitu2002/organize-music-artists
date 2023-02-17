#!/bin/sh
cd ~/Music/
for i in *
do
	if [[ $i == *.mp3 ]]
	then
		echo "$i" | cut -d'_' -f1  #departajeaza doar numele artistului
	fi
done > fisArtistiMelodii  #le afiseaza in acest fisier nou creat
cat fisArtistiMelodii | sort -u fisArtistiMelodii > fisBun
