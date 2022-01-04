#! /bin/bash

# Options :
	# lancer le programme en passant le nom du window manager 
	# lancer le programme sans argument et sélectionner le window manager dans une liste
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

# en cas de variable passée a l'exécution
if (( $default ));then
	# exception openbox
	if [[ "$1" == "openbox" ]] ; then
		switch_wm "openbox-lxde"	
	fi

	for i in "${window_managers[@]}"
	do
		if [[ "$i" == "$1" ]] ; then
			switch_wm $1
			exit 0
		fi	
	done
	echo $1 "n'est pas installée"
fi

# si aucune variable n'est passée
while (true)
do
	index=0
	echo "Préciser le window manager"

	#user input
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
