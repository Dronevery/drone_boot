#!/bin/bash

source ${WORKDIR}/net/U6100.sh
source ${WORKDIR}/net/route.sh

function init_net()
{
	info_msg "network starting..."
	init_U6100 "$U6100_DEV"
	route_3g
	info_msg "network ready"
}