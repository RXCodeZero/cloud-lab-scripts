#!/bin/bash

echo "===== SERVER INFO ====="
echo "Hostname: $(hostname)"
echo "User: $(whoami)"
echo "OS: $(cat /etc/redhat-release)"
echo "Kernel: $(uname -r)"
echo "Uptime: $(uptime -p)"
echo "Memory:"
free -h
echo "Disk:"
df -h /
echo "======================" 
