#!/bin/bash
source ${WORKDIR}/dev/dev.sh

function init_U6100()
{
	debug_msg "U6100(ppp) starting..."
	#local DEV
	#DEV=$(usb2dev 1c9e 9603 | awk '{print $3}')
	#debug_msg "U6100 dev file: $DEV"
	while [ ! $ip ];do
		debug_msg "U6100 try to connecting..."
		local ip=$(ip addr show dev ppp0 2>/dev/null | awk '{if($1=="inet") print $2}' | awk 'BEGIN{FS="/"}{print $1}' | head -n 1)
		if [ `ps aux | grep pppd | wc -l` = 1 ];then
			debug_msg "U6100 call pppd"
			/usr/sbin/pppd "${U6100_DEV}" connect "chat -v -f /srv/DTR-3G/chatscript "
		fi
		sleep 3
	done;
	
	export UNICOM_IFACE="ppp0"
	export UNICOM_IP=$ip
}