#!/bin/bash
export WORKDIR=/srv/drone_boot
export MAIN_ENTRY="${WORKDIR}/main.local"
export U6100_DEV="/dev/ttyUSB.U6100"
export C5100_DEV="/dev/ttyUSB.C5100"
export PL2303_DEV="/dev/ttyUSB.PIX"
export LOG_DIR="/var/log/drone"
export LOG_MAIN="${LOG_DIR}/drone"
export LOG_MAIN_LEVEL=3
export LOG_MAVPROXY="${LOG_DIR}/mavproxy"
export IP_SERVER="121.40.33.249"