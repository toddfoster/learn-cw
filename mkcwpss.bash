#!/bin/bash

PSS=pss
OUTDIR=mp3s
CW="$(which cwwav)"
LAME="$(which lame)" 
LAMEOPTS="-m j --preset medium"

CHARSPEED=35
MAXFARNSWORTH=35
FARNSWORTH=15
PSALM=1
MAXPSALM=150
COUNT=0
WEEK=7

for fn in $PSS/* ; do
    ps=$( basename "$fn" )
    (( COUNT++ ))
    if (( $COUNT > $WEEK)); then
        COUNT=1
        (( FARNSWORTH++ ))
        if (( $FARNSWORTH > $CHARSPEED )); then
            CHARSPEED=$FARNSWORTH
        fi
    fi
    echo "Psalm $ps  ($COUNT)  Speed=$CHARSPEED  Farnsworth=$FARNSWORTH"
    $CW --wpm=$CHARSPEED --farnsworth=$FARNSWORTH --output=$OUTDIR/$ps.wav $fn
    $LAME $LAMEOPTS $OUTDIR/$ps.wav $OUTDIR/$ps.mp3
    rm $OUTDIR/$ps.wav
done
