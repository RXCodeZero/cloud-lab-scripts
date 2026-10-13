#!/bin/bash

STATUS=0

HOSTNAME=$(hostname)
MEMORY=$(free -m | awk '/Mem:/ {print $3}')
DISK=$(df -P / | awk 'NR==2 {print $5}' | tr -d '%')

echo "===== SERVER HEALTH ====="
echo "Hostname: ${HOSTNAME}"
echo "Memory Used: ${MEMORY}MB"
echo "Disk Used: ${DISK}%"

if [ "$DISK" -gt 80 ]; then
	echo "WARNING: Disk usage is above 80%!"
	STATUS=1
else
	echo "Disk usage is Healthy!"
fi

echo "Nginx Status:"

if systemctl is-active --quiet nginx; then
	echo "Nginx is running!"
else
	echo "WARNING: Nginx is not running!"
	STATUS=1
fi

echo "========================="

exit $STATUS
