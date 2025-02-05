#!/bin/bash

function ctrl_c(){
    echo -e "\n\n[!] Exiting...\n"
    tput cnorm
    exit 1
}

# ctrl+C
trap ctrl_c SIGINT
tput civis

function checkPort(){
    nc -zv $1 $2 &>/dev/null
    
    if [ $? -eq 0 ];then
        echo "[+] Host $1 - Port $2 (OPEN)"
    fi
}

declare -a ports=( $(seq 1 65535) )

if [ $1 ]; then
    for port in ${ports[@]};do
        checkPort $1 $port &
    done
else
    echo -e "\n [!] Use: $0 <ip-adress>\n"
fi

wait

tput cnorm