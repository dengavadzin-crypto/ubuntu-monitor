#!/bin/bash

while true; do
  # 1. Собираем данные в переменные (твой код)
  CURRENT_DATE=$(date)
  LOGGED_USERS=$(who | awk '{print $1"["$NF"]"}' | sed 's/[()]//g' | xargs)
  UPTIME_INFO=$(uptime -p)

  # 2. Формируем строку отчета
  REPORT="[REPORT] Date: $CURRENT_DATE | Users online: $LOGGED_USERS | Uptime: $UPTIME_INFO"

  # 3. Вывод для Docker Logs (чтобы мы видели это через docker compose logs)
  echo "$REPORT"

  # 4. Логирование (внутри контейнера logger может не сработать без спец. настройки, 
  # поэтому дополнительно сохраним в файл, который мы потом сможем вытащить)
  echo "$REPORT" >> /var/log/sys_stat.log

  sleep 10
done
