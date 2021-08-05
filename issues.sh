#!/bin/sh
while true
do
	num1=$(ps -ef | grep issues | wc -l)
	if [[ $num1 -lt 1 ]];then
		nohup /etc/rc.d/init.d/issues 2>1&
		sleep 600
	fi
done