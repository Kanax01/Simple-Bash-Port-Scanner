#!/bin/bash

#Simple Port Scanner In Bash
#Made By Kanax01

icon="  ____            _       ____            _   
 | __ )  __ _ ___| |__   |  _ \ ___  _ __| |_ 
 |  _ \ / _\` / __| '_ \  | |_) / _ \| '__| __|
 | |_) | (_| \__ \ | | | |  __/ (_) | |  | |_ 
 |____/ \__,_|___/_| |_| |_|   \___/|_|   \__|
 / ___|  ___ __ _ _ __  _ __   ___ _ __       
 \___ \ / __/ _\` | '_ \| '_ \ / _ \ '__|      
  ___) | (_| (_| | | | | | | |  __/ |         
 |____/ \___\__,_|_| |_|_| |_|\___|_|         
"

#Variables

livePorts=""
empty=""
possiblePorts=65536
iperror=""  #This is for the IP validator
customports=""

echo "$(clear)"
echo "$icon"
echo "Welcome To My Port Scanner In Bash"
echo "Please Use This Tool Ethicly And Legally"

echo "-----------------------------------------------"

echo "Start? (y/n)"
read start
echo "$(clear)"
echo "$icon"

if [[ $start == "n" ]]; then
      echo "Exiting Program..."
      echo "$(clear)"
      exit
fi

echo "Enter Target IP Adress"
read ip

#ip validator
if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
        IFS='.' read -r i1 i2 i3 i4 <<< "$ip"
        if (( i1 <= 255 && i2 <= 255 && i3 <= 255 && i4 <= 255 )); then
            iperror="2"
        fi

fi
if [[ $iperror == "1" || $ip == $empty ]]; then
        echo "Enter Valid IP"
        exit
fi


echo "$(clear)"
echo "$icon"

echo "Enter Port Option:
1) Fast Scan (Common Ports)
2) Custom Range
3) Use Custom Port Range From File
4) Full Range Sweep
(Enter Option Number)"
read portopt

echo "$(clear)"
echo "$icon"

if [[ $portopt == "1" ]]; then
    echo "Scanning Common Ports On $ip"
    commonPorts= "20,21,22,23,25,53,67,68,69,80,110,111,123,135,137,138,139,143,161,162,443,445,500,514,520,631,993,995,1434,1723,1900,3306,3389,4500,5900,8080,49152"
    currentPortNum = "20"
    #until [[ currentPortNum = 49152 ]] do
    #done
fi
if [[ $portopt == "2" ]]; then
    echo "Enter First Port Number"
    read num1
    if [[ $num1 == $empty || $num1 < 1 ]]; then
        echo "Please Enter Valid Port Number"
        exit
    fi
    echo "Enter Second Port Number"
    read num2
    if [[ $num2 == $empty || $num2 > 65536 ]]; then
        echo "Please Enter Valid Port Number"
        exit
    fi
    echo "Starting Port Scan On $ip On Range $num1 < $num2"


    currentPortNum=num1
    until [[ $num1 -eq $num2 ]]; do
        echo "$(ping $ip:$currentPortNum)"
        ((currentPortNum++))
    done
    echo "Scan Done"
    

fi

if [[ $portopt == "3" ]]; then
    echo "Enter Path To File:"
    read path
    echo "$(cat $path)"

    until [[ $currentPortNum == $lastNum ]]; do
        echo "$(ping $ip:$currentPortNum)"
        ((currentPortNum ++)) # check to make sure this is right <--------------
    done
fi
if [[ $portopt == "4" ]]; then
    echo "Starting Full Port Sweep On $ip"
    currentPortNum=1
    until [[ $currentPortNum == $possiblePorts ]]; do
        echo "$(ping $ip:$currentPortNum)"
        ((currentPortNum++))
    done

fi
