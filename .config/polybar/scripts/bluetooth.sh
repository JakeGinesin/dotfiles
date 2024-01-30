if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
	echo ""
else
	if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
	then
		echo ""
	fi
  device=$(bluetoothctl info | grep "Name" | cut -d ' ' -f 2-)
  if [[ "$device" == "" ]]
  then
    echo "%{F#2193ff}"
  else
    echo "%{F#2193ff}  %{F#ffffff}[$device]"
  fi
fi
