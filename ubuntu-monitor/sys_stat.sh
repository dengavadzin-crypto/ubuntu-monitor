#!/bin/bash

while true; do
  CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")
  LOGGED_USERS=$(who | awk '{print $1"["$NF"]"}' | sed 's/[()]//g' | xargs)
  CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }')
  UPTIME_INFO=$(uptime -p)

  REPORT="[MONITOR] $CURRENT_DATE | Users: ${LOGGED_USERS:-none} | CPU Load:$CPU_LOAD | $UPTIME_INFO"

  echo "$REPORT"
  echo "$REPORT" >> /var/log/sys_stat.log

  sleep 10
done
