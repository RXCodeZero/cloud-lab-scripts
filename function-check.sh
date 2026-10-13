#!/bin/bash

check_service(){
	SERVICE="$1"
	
	if systemctl is-active --quiet "$SERVICE"; then
		echo "$SERVICE: RUNNING"
	else
		echo "$SERVICE: NOT RUNNING"
	fi
}

check_service "sshd"
check_service "nginx"
check_service "firewalld"

