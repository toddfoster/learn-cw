#!/bin/bash

CW="$(which cwwav)"
LAME="$(which lame) --preset medium"

SPEED=35

for fn in "$@" ; do
    t=$( basename "$fn" ".txt" )
    echo "Processing $t"
    $CW --wpm=$SPEED --output=$t.wav $fn
    $LAME $t.wav $t.mp3
    rm $t.wav
done
