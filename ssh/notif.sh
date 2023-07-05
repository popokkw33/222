#!/bin/bash
TIMES="10"
CHATID="5641321832"
KEY="5621227316:AAFp_SxXGwD9NE0HgSBCU0sP4fsJmuo1YzE"
URL="https://api.telegram.org/bot$KEY/sendMessage"
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
IP=$(echo $SSH_CLIENT | awk '{print $1}')
TMPFILE='/tmp/ipinfo-$DATE_EXEC.txt'
curl http://ipinfo.io/$IP -s -o $TMPFILE
ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')
domain=$(cat /etc/xray/domain)
LocalVersion=$(cat /root/versi)
IPVPS=$(curl -s ipinfo.io/ip )
ISPVPS=$( curl -s ipinfo.io/org )
Exp=$(curl -sS https://raw.githubusercontent.com/sibeesans/hss/main/ipvps | grep $MYIP | awk '{print $3}')
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}' | head -1)"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}' | head -1)"
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
Name=$(curl -sS https://raw.githubusercontent.com/sibeesans/hss/main/ipvps | grep $MYIP | awk '{print $2}')
MYIP=$(curl -sS ipv4.icanhazip.com)
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<u>⚠️ AUTOSCRIPT INSTALLER ⚠️</b>
<u>  ⚠️ SIBEESANS STORE ⚠️</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>DOMAIN     : </code><code>${domain}</code>
<code>LINUX      : </code><code>${MYIP}</code>
<code>ISP        : </code><code>${ISP}, ${CITY}</code>
</code>AUTHOR    : </code><code>${Name}</code>
</code>EXP SCRIPT: </code><code>${Exp}</code>
<code>◇━━━━━━━━━━━━━━◇</code>
"
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
cd
