#!/bin/bash
#Задание 1: Пример сборки и запуска контейнера c фронтэндом
#Собираем docker-образ для фротнэнда
docker build -t frontend:latest -t frontend:1.0 -f ./Dockerfile.frontend .
#Запускаем контейнер с фротнэндом
docker run -d -p 8080:80 --name frontend --restart=unless-stopped frontend