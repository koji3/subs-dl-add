#!/bin/bash


for file in $@ ; do
	nombre=$(echo $file | rev | cut -c 5- | rev)
	subliminal -les "$file"
	if [[ $(test -e "$nombre.es.srt") = '' ]] ; then 
		mencoder "$file" -ovc xvid -oac mp3lame -lameopts abr:br=192 -xvidencopts pass=2:bitrate=-700000 -sub "$nombre.es.srt" -subcp utf-8 -subfont-text-scale 2.8 -o "$nombre.avi"
	fi

done


