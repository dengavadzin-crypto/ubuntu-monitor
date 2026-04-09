#!/bin/bash

# 1. Собираем данные в переменные
CURRENT_DATE=$(date)
LOGGED_USERS=$(who | awk '{print $1"["$NF"]"}' | sed 's/[()]//g' | xargs)
UPTIME_INFO=$(uptime -p)    # Флаг -p делает вывод "красивым" (pretty)

# 2. Формируем одну общую строку для отчета
REPORT="[REPORT] Date: $CURRENT_DATE | Users online: $LOGGED_USERS | Uptime: $UPTIME_INFO"

# 3. Выводим отчет на экран (чтобы мы видели его в консоли)
echo "$REPORT"

# 4. Отправляем отчет в системный журнал
logger "$REPORT"

echo "Информация успешно сохранена в системный журнал."
