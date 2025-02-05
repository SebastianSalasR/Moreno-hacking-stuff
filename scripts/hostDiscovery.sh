#!/bin/bash

function ctrl_c(){
    echo -e "\n\n[!] Exiting...\n"
    tput cnorm
    exit 1
}
tput civis

#Ctrl+C
trap ctrl_c SIGINT

# If the hosts doesn't accept ICPM ping we can try with ports
for i in $(seq 1 254); do
    # Common ports
    for port in 21 22 23 25 80 139 443 445 3000 8080; do 
        timeout 1  bash -c "nc -zv 192.168.1.$i $port" &>/dev/null && echo "[+] Host 192.168.1.$i - Port $port (OPEN)" &
    done
done

wait

tput cnorm