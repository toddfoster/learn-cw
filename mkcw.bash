#!/bin/bash

CW="$(which cwwav)"
LAME="$(which lame) --preset medium"
FREQ=500

CHARSPEED=40
FARNSWORTH=15

for fn in "$@" ; do
    t=$( basename "$fn" ".txt" )
    echo "Processing $t"
    $CW --wpm=$CHARSPEED --farnsworth=$FARNSWORTH --frequency=$FREQ \
        --output=$t.wav $fn
    $LAME $t.wav $t.mp3
    rm $t.wav
done
