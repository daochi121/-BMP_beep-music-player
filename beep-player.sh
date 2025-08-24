#!/bin/sh
#确保文件存在
TONEF0=./beep-CCAPS.sh
TONEF1=./beep-CMajor.sh
TONEF2=./beep-CEasy.sh
FUNCF=./beep-function.sh

if [ -f $TONEF0 ];then
. $TONEF0
else
echo "未找到:$TONEF0"
return 1
fi

if [ -f $TONEF1 ];then
. $TONEF1
else
echo "未找到:$TONEF1"
return 1
fi

if [ -f $TONEF2 ];then
. $TONEF2
else
echo "未找到:$TONEF2"
return 1
fi

if [ -f $FUNCF ];then
. $FUNCF
else
echo "未找到:$FUNCF"
return 1
fi

FILE=$1
BEEPSHNAME="01-蜂鸣器播放-"$(echo $FILE | perl -pe "s/\//_/g" | perl -pe "s/.txt//g")".sh"
if [ -f $BEEPSHNAME ];then
    rm $BEEPSHNAME
fi
touch $BEEPSHNAME
echo "文件已创建:$BEEPSHNAME"
#echo "#!/bin/sh" >> $BEEPSHNAME
cat $TONEF0 >> $BEEPSHNAME
cat $TONEF1 >> $BEEPSHNAME
cat $TONEF2 >> $BEEPSHNAME
cat $FUNCF >> $BEEPSHNAME
cat "$FILE" | while IFS= read -r line
do

    if [ -z "$line" ]; then
        echo "echo \"\" " >> $BEEPSHNAME
    elif [ "$(echo "$line" | awk '{print substr($0,1,1)}')" = "|" ]; then
            #别问 至少空格不会影响播放
            #outling=$(echo $line | perl -pe "s/:/ /g;s/\|/\nt /g;s/ t/;t /g;s/t 0/d /g;s/t BPM/b /g;s/  / /g;s/ \n/\n/g")
            #outling=$(echo $line | perl -pe "s/:/ /g;s/\|/ t /g;s/ t /\nt /g;s/t 0/\nd /g;s/t BPM/\nb /g;s/  / /g;s/ \n/\n/g;s/t\n//g")
            #---------------------------------换:为“ ”;-换|为t-----换0为d-------换BPM为b--------换TTNM为ttnm---------替换THZ为th----清空多余空格与无用t
            outling=$(echo $line | perl -pe "s/:/ /g;s/\|/ \nt /g;s/t 0/\nd /g;s/t BPM/\nb /g;s/t TTNM/\nttnm /g;s/t THZ/\nth /g;s/  / /g;s/ \n/\n/g;s/t\n//g")
            echo "$outling" >> $BEEPSHNAME
            echo "echo \"\" " >> $BEEPSHNAME
    else
        #注释下面这行不输出文字
        echo "echo \"$(echo $line | perl -pe 's/\"/\\"/g')\" " >> $BEEPSHNAME
    fi
done


#echo "------------"
#cat $BEEPSHNAME
echo "-----------------"
sh $BEEPSHNAME
echo ""
