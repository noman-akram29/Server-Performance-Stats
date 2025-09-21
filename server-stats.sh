#!/bin/bash

echo "Total CPU usage"
echo "-----------------------------------------------------------------------------------"
mpstat 1 1
echo -e "\n"

echo "Total memory usage (Free vs Used including percentage)"
echo "-----------------------------------------------------------------------------------"
free -b | awk '/Mem:/ {
    printf "Size: %.2f GiB | Used: %.2f GiB | Free: %.2f GiB | Usage: %.0f%%\n", 
    $2/2^30, $3/2^30, $4/2^30, ($3/$2)*100
}'
echo -e "\n"

echo "Total disk usage (Free vs Used including percentage)"
echo "-----------------------------------------------------------------------------------"
df -h --total | awk '/total/ {
    printf "Size: %s | Used: %s | Free: %s | Usage: %s\n", $2, $3, $4, $5
}'
echo -e "\n"

echo "Top 5 processes by CPU usage"
echo "-----------------------------------------------------------------------------------"
ps -eo user,pid,%cpu,vsz,rss,tty,stat,start,time,comm --sort=-%cpu | head -n 6 | column -t
echo -e "\n"

echo "Top 5 processes by memory usage"
echo "-----------------------------------------------------------------------------------"
ps -eo user,pid,%mem,vsz,rss,tty,stat,start,time,comm --sort=-%mem | head -n 6 | column -t

