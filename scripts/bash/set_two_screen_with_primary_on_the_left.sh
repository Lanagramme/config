#!/bin/bash

nbr=$(xrandr --listmonitors | grep Monitors | awk '{print $2}')
nbr=$((nbr))

if (( nbr == 2)); then
  primary=$(xrandr --listmonitors | sed '1d' | awk '{print $4}' | awk 'NR==1')
  second=$( xrandr --listmonitors | sed '1d' | awk '{print $4}' | awk 'NR==2')

  xrandr --output $primary --primary --auto --left-of $second
fi
