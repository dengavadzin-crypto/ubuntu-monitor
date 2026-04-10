#!/bin/bash

while true; do
  # Обновим формат даты и добавим Load Average
  CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")
  CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }')
  UPTIME_INFO=$(uptime -p)

  # Новый заголовок, чтобы сразу заметить обновление
  REPORT="[v2.0 MONITORING] $CURRENT_DATE | CPU Load:$CPU_LOAD | $UPTIME_INFO"

  echo "$REPORT"
  # Логируем внутри контейнера
  echo "$REPORT" >> /var/log/sys_stat.log

  # Ускорим проверку до 5 секунд для теста
  sleep 5
done
