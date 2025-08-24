#BMP_beep-music-player
#sh them here 

#Dependens:beep,Perl  
apt install beep perl

#chmod your buzzer device to 766 (May others diffe) 
chmod 766 /dev/input/by-path/platform-pcspkr-event-spkr

#Run "beep" 
#If your beep BB, it means it's OK

#There is sh files and music folders. Music.

#Try
Sh beep_player music/DoRemi.txt
#You will see more

#and it will create a sh file for others to play by:
sh <just generated sh file>
#without this

#My English is sorry


#中文请见：https://gitee.com/dzwdyx121/beepmusicsh
beep命令播放音乐
#请在该目录执行sh脚本 #记得安装beep,perl命令! apt install beep

#然后给你的蜂鸣器设备766权限（这里是我的蜂鸣器位置 其他设备不知道是不是） chmod 766 /dev/input/by-path/platform-pcspkr-event-spkr

#运行命令测试一下 beep #你的主板哔～了一下就说明OK

#再看文件 #下载好后cd进去，ls一下有几个.sh和music文件夹，music顾名思义就存音乐的

#先看脚本 这样一下 source beep-CCAPS.sh source beep-function.sh #这个是t单音符发声命令 A是键帽 1是时值就几分音符 执行以下 发声Do就OK t A 1 #可以设置BPM变量 export BPM=240 ###################################################### #像这样可以播放一个文本文件，剩下关于编辑文件播放文件的都在这了。 sh beep-player.sh music/DoReMi.txt #并且还会创建一个脚本让其他人在没这个播放器的情况下播放 sh <刚刚生成的sh文件> ######################################################

#安装说明 #手动把sh脚本cp到bin， #运行sh beep-player.sh 报错：未找到:./beep-CCAPS.sh #解决：移动对应文件到beep-player.sh同级目录或修改beep-player.sh对应的类似"TONEF0=./beep-CCAPS.sh"变量内容 #比如在~/.local/bin/ beep-player.sh #就修改变量为: #---------------------------- #TONEF0=~/.local/bin/beep-CCAPS.sh #TONEF1=~/.local/bin/beep-CMajor.sh #TONEF2=~/.local/bin/beep-CEasy.sh #FUNCF=~/. local/bin/beep-function.sh #----------------------------
