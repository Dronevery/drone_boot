#!/bin/bash

function route_3g()
{
	ip route replace ${IP_SERVER} dev ${UNICOM_IFACE}
}