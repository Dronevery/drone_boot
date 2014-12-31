function vendor_id()
{
	local dev_path=$1
	echo `udevadm info ${dev_path} 2>/dev/null | grep ID_VENDOR_ID | awk 'BEGIN{FS="="} {print $2}'`
}

function model_id()
{
	local dev_path=$1
	echo `udevadm info ${dev_path} 2>/dev/null | grep ID_MODEL_ID | awk 'BEGIN{FS="="} {print $2}'`
}

function usb2dev() #get /dev/... with USB VENDOR_ID and MODEL_ID
{
	local VENDOR_ID=$1
	local MODEL_ID=$2
	local DEV_PREFIX=$3

	if [ ! $DEV_PREFIX ];then
		DEV_PREFIX="/dev/ttyUSB"
	fi

	declare -a dev_list
	local vid
	local mid

	for dev in ${DEV_PREFIX}* ;do
		vid=$(vendor_id $dev)
		mid=$(model_id $dev)
		#echo $vid $VENDOR_ID $mid $MODEL_ID $dev
		if [[ $mid = ${MODEL_ID} && $vid = ${VENDOR_ID} ]]; then
			dev_list[${#dev_list[*]}]=$dev
		fi
	done
	echo ${dev_list[*]}
}