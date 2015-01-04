#!/bin/bash
function ipaddress()
{
	local interface=$1
	echo ip addr show dev $interface 2>/dev/null | awk '{if($1=="inet") print $2}' | awk 'BEGIN{FS="/"}{print $1}' | head -n 1
}