#! /bin/bash

declare -a window_managers=('awesome' 'openbox-lxde')

# check for default default
test -z $1 && default=0 || default=1

function switch_wm () {
	rm /etc/xdg/lxsession/LXDE-pi/autostart
	echo [Session] | cat > ./desktop.temp
	if [[ "$1" == "openbox-lxde" ]]
	then 
		cat autostart.openbox autostart > /etc/xdg/lxsession/LXDE-pi/autostart
	else
		cp autostart /etc/xdg/lxsession/LXDE-pi/autostart
	fi

	echo "window_manager="$1 | cat >> ./desktop.temp

	cat ./desktop.temp desktop.conf.default > /etc/xdg/lxsession/LXDE-pi/desktop.conf

	reboot
}

if (( $default ));then
	for i in "${window_managers[@]}"
	do
		if [[ "$i" == "$1" ]] ; then
			switch_wm $1
			exit 0
		fi	
	done
	echo $1 "n'est pas installée"
fi

# user input
while (true)
do
	index=0
	echo "Préciser le window manager"

	for i in "${window_managers[@]}"
	do
		echo $index : $i
		index=$(( index+1 ))
	done

	read wm

	if (( $wm >= 0 && $wm < ${#window_managers[@]} )); then
		switch_wm ${window_managers[wm]}
		exit 0
	fi

	echo "Entrée invalide"
done
