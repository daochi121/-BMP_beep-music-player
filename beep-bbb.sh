#!/bin/sh
T=0
D=0
while [ 1 ] ;
do
beep -f 3000 -l 100
sleep 0.1
T=$(($T+1))
D=$(($D+1))
if [ $T -eq "3" ] ;
then
sleep 0.5
T=0
fi
if [ $D -eq "9" ] ;
then
exit
fi
done
