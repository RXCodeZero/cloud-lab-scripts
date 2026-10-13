#!/bin/bash

SERVICES=("sshd" "nginx" "firewalld")

for SERVICE in "${SERVICES[@]}"; do
	if systemctl is-active --quiet "$SERVICE"; then
		echo "$SERVICE: RUNNING"
	else
		echo "$SERVICE: NOT RUNNING"
	fi
done
