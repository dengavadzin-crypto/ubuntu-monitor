# Ubuntu System Monitor 🚀

Лёгкий инструмент мониторинга Ubuntu-сервера, упакованный в Docker-контейнер.

## Что мониторит
- Дату и время
- Активных пользователей и их IP
- CPU Load Average
- Аптайм сервера

## Стек
- Bash, Docker, GitHub Actions

## Структура
ubuntu-monitor/
  Dockerfile       — образ контейнера
  sys_stat.sh      — скрипт мониторинга
user/
  create_users.sh  — создание пользователей с паролем и sudo

## CI/CD
Push в ветку `ubuntu-monitor` → GitHub Actions собирает образ,
проверяет синтаксис и деплоит на сервер по SSH.

## Запуск вручную
docker compose up -d --build

## Просмотр логов
docker compose logs -f monitor
