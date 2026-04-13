# Denys — Server Infrastructure

## Структура проекта

```
/root/Denys/
├── docker-compose.yml          — запуск всего стека мониторинга
├── monitoring/
│   ├── ubuntu-monitor/
│   │   ├── Dockerfile          — образ контейнера мониторинга
│   │   └── sys_stat.sh         — скрипт сбора метрик (CPU, users, uptime)
│   └── prometheus/
│       └── prometheus.yml      — конфигурация Prometheus
├── kubernetes/
│   └── nginx-deployment.yaml   — Deployment + Service для nginx (3 реплики)
├── scripts/
│   ├── setup.sh                — первичная настройка сервера (apt update/upgrade)
│   └── create_users.sh         — создание пользователей с паролем и sudo
└── logs/                       — логи мониторинга (не в git)
```

## Быстрый старт

### Запуск мониторинга
```bash
docker compose up -d
```

| Сервис        | URL                      |
|---------------|--------------------------|
| Grafana       | http://localhost:3000    |
| Prometheus    | http://localhost:9090    |
| Node Exporter | http://localhost:9100    |

### Создание пользователей
```bash
bash scripts/create_users.sh user1 user2
```

### Первичная настройка сервера
```bash
bash scripts/setup.sh
```

### Kubernetes — деплой nginx
```bash
kubectl apply -f kubernetes/nginx-deployment.yaml
```
