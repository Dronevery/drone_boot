#!/bin/bash
export WORKDIR=/srv/startup
export MAIN_ENTRY="${WORKDIR}/main.sh"
export U6100_DEV="/dev/ttyUSB3"
export PL2303_DEV="/dev/ttyUSB0"
export LOG_DIR="/var/log/dronevery"
export LOG_MAIN="${LOG_DIR}/dronevery"
export LOG_MAVPROXY="${LOG_DIR}/mavproxy"