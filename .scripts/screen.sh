#!/bin/sh

for i in 5 4 3 2 1
do
    toilet -f ascii12 $i | \
      xmessage -buttons "" -timeout 1 -center -file -
    #sleep 1
done

xset dpms force off

# sleeping for 10 secs, so no accidental mouse movements wake us up
