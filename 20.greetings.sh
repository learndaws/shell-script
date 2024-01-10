#!/bin/bash

USAGE()
{
    echo "USAGE:: $(basename $0) -n <name> -w <wishes> -h <help>"
    echo "ERROR::"
    echo "-n, specify the name(mandatory)"
    echo "-w, specify the wishes(optinal)"
    echo "-h, this is for help"
}

while getopts ":n:w:h" opt; 
do 
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        h|*) USAGE; exit;;
        \?) echo "invalid options -"$OPTARG"" >&2; exit;;
    esac
done

if [ -z "$NAME" ] || [ -z "$WISHES" ];
    then
        echo "ERROR: Both -n and -w are mandatory options"
        USAGE
        exit 1
fi

echo "Hello $NAME, $WISHES. How are you doing?"