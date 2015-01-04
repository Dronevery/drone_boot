#!/bin/bash

function route_3g()
{
	if [ $IFACE_UNICOM ];then
		ip rule add from ${IP_UNICOM} lookup 1000 pref 1000
		ip route replace ${IP_SERVER} dev ${IFACE_UNICOM} table 1000
		ip route replace ${IP_SERVER} dev ${IFACE_UNICOM} table main
	fi

	if [ $IFACE_TELECOM ];then
		ip rule add from ${IP_TELECOM} lookup 1001 pref 1001
		ip route replace ${IP_SERVER} dev ${IFACE_TELECOM} table 1001
		ip route replace ${IP_SERVER} dev ${IFACE_TELECOM} table main
	fi

}