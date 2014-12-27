#!/bin/bash
export WORKDIR=/srv/drone_boot
export MAIN_ENTRY="${WORKDIR}/main.local"
export U6100_DEV="/dev/ttyUSB3"
export PL2303_DEV="/dev/ttyUSB0"
export LOG_DIR="/var/log/drone"
export LOG_MAIN="${LOG_DIR}/drone"
export LOG_MAVPROXY="${LOG_DIR}/mavproxy"