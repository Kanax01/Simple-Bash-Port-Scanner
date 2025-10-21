#!/bin/bash

#Simple Port Scanner In Bash
#Made By Kanax01


icon= "


"

possiblePorts = 65536

echo "Welcome To My Port Scanner In Bash"
echo "Please Use This Tool Ethicly And Legally"

echo "-----------------------------------------------"

echo "Start? (y/n)"
read start

if [[ start == "n" ]]; then
      echo "Exiting Program..."
      exit
fi

echo "Enter Target IP Adress"
read ip
echo "Enter Port Option:

1) Fast Scan (Common Ports)
2) Custom Range
3) Full Range Sweep
(Enter Option Number)"
read portopt

if [[ portopt == "1" ]]; then
    echo "Scanning Common Ports On $ip"
    #enter common port scanning here
fi
if [[ portopt == "2" ]]; then
    echo "Enter First Port Number"
    read num1
    echo "Enter Second Port Number"
    read num2
    echo "Starting Port Scan On $ip On Range $num1 < $num2"

    #enter func here
    echo "Scan Done"
    #enter scan diplay func here
    
fi
if [[ portopt == "3" ]]; then
    echo "Starting Full Port Sweep On $ip"
    until [[ $currentPortNum = $possiblePorts ]]; then
    echo "$(ping $ip:$currentPortNum)"
    currentPortNum = (currentPortNum ++)
    
    






