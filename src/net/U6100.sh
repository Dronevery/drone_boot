#!/bin/bash
source ${WORKDIR}/net/ip.sh

function init_U6100()
{
	debug_msg "U6100(ppp) starting..."
	if [ ! -e "${U6100_DEV}" ];then
		warn_msg "NO U6100 device, abort"
		return 0
	fi
	while [ ! $ip ];do
		debug_msg "U6100 try to connecting..."
		local ip=$(ipaddress ppp2)
		if [ `ps aux | grep U6100 | wc -l` = 1 ];then
			debug_msg "U6100 call pppd"
			/usr/sbin/pppd "${U6100_DEV}" connect "chat -v -f /etc/ppp/chat/u6100.chatscript" unit 2
		fi
		sleep 3
	done;
	
	export IFACE_UNICOM="ppp2"
	export IP_UNICOM=$ip
}