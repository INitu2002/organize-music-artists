#!/bin/sh
echo -e "Doriti organizarea directorului Music?\n 1 - Da \n 2 - Nu"
echo "Raspuns: "
read optiune
if [[ $optiune -eq 1 ]]
then
	echo "Se organizeaza!"
	nrmp3=0
	for i in ~/Music/*
	do
		if [[ $i == *.mp3 ]]
		then
			nrmp3=`expr $nrmp3 + 1`
		fi
	done
	echo "Sunt $nrmp3 fisiere mp3 in folderul Music!"
	nrArtistiDif=$(cat fisArtistiMelodii | sort -u | wc -l)
	echo "Sunt $nrArtistiDif artisti diferiti in playlist!"
#	citesc linie cu linie din fisBun
	while read -r line 
	do
		echo $line
		length=${#line}
		echo $length
#		creare director cu numele artistului
		mkdir $line
		for i in ~/Music/*
		do
			if [[ $i == */$line* && -f $i ]]
			then
				mv $i ~/Music/$line
			fi
		done
	done < fisBun
else
	echo -e "Nu se organizeaza!\n"
fi
