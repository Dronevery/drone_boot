#!/bin/bash

function route_3g()
{
	ip route replace 121.40.33.249 dev ${UNICOM_IFACE}
}