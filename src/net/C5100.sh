#!/bin/bash
source ${WORKDIR}/net/ip.sh

function init_C5100()
{
	debug_msg "C5100(ppp) starting..."
	if [ ! -e "${C5100_DEV}" ];then
		warn_msg "NO C5100 device, abort"
		return 0
	fi
	while [ ! $ip ];do
		debug_msg "C5100 try to connecting..."
		local ip=$(ipaddress ppp1)
		if [ `ps aux | grep C5100 | wc -l` = 1 ];then
			debug_msg "C5100 call pppd"
			/usr/sbin/pppd "${C5100_DEV}" connect "chat -v -f /etc/ppp/chat/c5100.chatscript" unit 1 user "card" password "card" 
		fi
		sleep 3
	done;
	
	export IFACE_TELECOM="ppp1"
	export IP_TELECOM=$ip
}