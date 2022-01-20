#!/bin/bash
#Задание 2: Пример сборки и запуска контейнеров с базой и бэкэндом
#Создаем сеть
docker network create --driver bridge --subnet 192.168.100.0/24 --ip-range 192.168.100.0/24 backend-net
#Запускаем контейнер с БД
docker run -d --name database --network backend-net --restart=unless-stopped -e POSTGRES_DB=django -e POSTGRES_USER=django -e POSTGRES_PASSWORD=django postgres:alpine
#Собираем docker-образ для бэкэнда
docker build -t backend:latest -t backend:1.0 -f ./Dockerfile.backend .
#Запускаем контейнер с бэкэндом
docker run -d -p 8000:8000 --name backend --network backend-net --restart=unless-stopped backend
