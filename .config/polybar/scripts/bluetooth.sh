if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
	# echo "%{F#66ffffff}"
	echo ""
else
	if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
	then
		#  echo ""
		echo ""
	fi
  # echo ""
	echo "%{F#2193ff}"
fi
