#! /usr/bin/bash

echo $1

for arg in "$@"; do
    echo $arg
    cat $arg | awk '/^element/ {print $0}'
done
