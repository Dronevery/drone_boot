#!/bin/bash

function init_mavproxy()
{
	debug_msg "mavlink_async"
	nohup python /home/xuhao/mavasync/mavlink_async.py >> ${LOG_MAVPROXY} &	
}

