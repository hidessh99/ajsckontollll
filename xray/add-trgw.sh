source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do                read -rp "ชื่อ: " -e user
                CLIENT_EXISTS=$(grep -w $user /etc/v2ray/trojan.json | wc -l)

                if [[ ${CLIENT_EXISTS} == '1' ]]; then
                        echo ""
                        echo " มีชื่อในระบบแล้ว โปรดเลือกชื่ออื่น."
                        exit 1
                fi
        done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "วันหมดอายุ (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#tls$/a\### '"$user $exp"'\
},{"password": "'""$user""'","email": "'""$user""'"' /etc/v2ray/trojan.json
systemctl restart v2ray@trojan
trojanlink="trojan://${user}@${domain}:443"
clear
echo -e ""
echo -e "********************************" 
echo -e "           ข้อมูลบัญชี"   
echo -e "ชื่อ          : ${user}"
echo -e "โฮสต์        : ${domain}"
echo -e "พอร์ต        : 443"
echo -e "คีย์          : ${user}"
echo -e "วันหมดอายุ    : $exp"
echo -e "ลิงก์         : ${trojanlink}"
echo -e "*********************************"
echo -e "สคริปโดยเอเน้ต"
