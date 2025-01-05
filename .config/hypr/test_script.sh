#!/bin/bash
clear
#user= whoami
if [ $# -ne 1 ]
then
echo "Warning: need exactly one command line argument."
    echo "Usage: $0 <inputfile_name>"
    exit 1
fi
RED='\033[0;31m'
shuf -n 1 $1
#cowsay -f tux $output
#echo -e "${RED}${!output}"
