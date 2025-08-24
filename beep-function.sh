BPM=120
TIT="蜂鸣器播放"

#半音切换
TTNM=0
ttnm(){
et "TTNM" $1
export TTNM=$1
}
tt(){
echo $1 $(($2+$TTNM)) | awk '{print $1*2^($2/12)}'
}

#输出播放的音符
et(){
if [ -z $3 ] ; then
echo "| $1:$2 \c"
elif [ -z $4 ] ; then
echo "| $1:$2 $3 \c"
else
echo "| $1:$2 $3 $4 \c"
fi

}
# et(){
# #echo "$1:$2 $3"
# if [ -z $3 ] ;
# then
# echo "| $1:$2 \c"
# else
# echo "| $1:$2 $3 \c"
# fi
# }

#休止
d(){
et 0 $1 $2
if [ -z $2 ] ;
then
sleep $((240/$BPM/$1))
else
sleep $((240/$BPM/$1+240/$BPM/$2))
fi
}


export AUDIODRIVER=alsa
export PATH="$PATH:/usr/bin/bc"
#羊生气(bushi)播放音符
#t(){
#et $1 $2 $3
#if [ -z $3 ] ;
#then
#play -n synth 0$(echo "scale=3;240/$BPM/$2"| bc) sine $(($1)) > /dev/null
#else
#play -n synth 0$(echo "scale=3;240/$BPM/$2+240/$BPM/$3"| bc) sine $(($1)) > /dev/null
#fi
#}

#蜂鸣器播放音符
t(){
et $1 $2 $3 $4
if [ -z $3 ] ;
then
beep -f $(tt $(($1)) $4) -l $((240000/$BPM/$2))
else
beep -f $(tt $(($1)) $4) -l $((240000/$BPM/$2+240000/$BPM/$3))
fi
}
#特定频率时间播放
th(){
et THZ $1 $2
beep -f $1 -l 0$2
}

#更改节奏速度
b(){
et "BPM" $1
export BPM=$1
}



