#!/bin/bash

source ${WORKDIR}/net/U6100.sh
source ${WORKDIR}/net/C5100.sh
source ${WORKDIR}/net/route.sh
source ${WORKDIR}/net/port.sh

function init_net()
{
	info_msg "network starting..."
	init_U6100
	init_C5100
	route_3g
	tcp_port_map 10000 10000 20000 #Directional broadcast port
	tcp_port_map 22 10022 20022 #Directional broadcast port
	info_msg "network ready"
}