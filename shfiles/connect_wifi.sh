#! /bin/bash

echo "Scanning for network .."
# sudo iwlist wlan0 scan | grep ESSID

first=0
net=0
check=0


while [[ $check == 0 ]]
do
	echo $first
	if [[ $first -eq 1 ]]
		echo Please enter a valid answer;
	fi
	
	echo "which network do you wich to connect to ?"
	echo "1 : Galaxy Tab S7B2CA"
	echo "2 : Livebox-B436"
	echo "3 : Repeater-3378ca"
	read $net

	if [$net == 1 || $net == 2 || $net == 3]
		$check=1; then
		break
	fi
	((first++))
done

echo $net
