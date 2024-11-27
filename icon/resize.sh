#!/bin/bash

directory="$(dirname "$BASH_SOURCE")/"
icon="favicon.svg"
iconMaskable="maskable.svg"
sizes=(36 48 72 96 128 144 192 256 384 512 1024 2048)

for i in "${sizes[@]}"; do
	echo Resizing $i

	name=$i"x"$i".png"
	rsvg-convert -w $i -h $i "$directory$icon" -o "$directory$name"

	name=$i"x"$i"-maskable.png"
	rsvg-convert -w $i -h $i "$directory$iconMaskable" -o "$directory$name"
done

shortcuts=("hhmm" "hhmmss")

for i in "${shortcuts[@]}"; do
	echo "Resize shortcut $i"
	rsvg-convert -w 96 -h 96 "$directory"shortcut-"$i.svg" -o "$directory"shortcut-"$i.png"
done

echo Done
