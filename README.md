## Структура
ubuntu-monitor/
  Dockerfile          — образ контейнера
  sys_stat.sh         — скрипт мониторинга
user/
  create_users.sh     — создание пользователей с паролем и sudo
scripts/
  setup.sh            — первичная настройка сервера (apt update/upgrade)
logs/                 — логи мониторинга (не в git)