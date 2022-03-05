# Candidate Name: Avinash Yelpula
# Project Name: Demo-nodejs-project
# Creation Date: 5th march 2022.
# Purpose: Deploy Nodejs based application on docker container platform.

# Build Process:

Download the given code  in personal laptop and created below mentioned files in order to deploy the application in muliple docker containers.

# Dockerfile creation

Vi Dockerfile
----
FROM node:latest

CREATE APP DIRECTORY:

WORKDIR /usr/src/app 

Install app dependencies:

COPY package*.json ./
RUN npm install

Copy app source code from source to dest path:  

COPY . .

Expose port (to access) and start application:  

 EXPOSE 8080
 CMD [ "npm", "start" ]



# Docker compose yaml file creation to run multiple containers

Here in this file docker compose version is (3.8).
By this file we are creating three containers with name like app, mangodb and mysql to run each service seperately.
The volumes are mounted for mongodb and mysql in order to persist data or save data in case of server or container crashes.

Vi docker-compose.yaml
-----
version: "3.8"
services:
  app:
    build: .
    ports:
    - "8080:8080"
    depends_on:
    - mongo
    - mysql
  mongo:
    image: mongo
    ports:
    - "27017:27017"
    volumes:
    - mongo-volume:/data/db
  mysql:
    image: mysql:8
    restart: always
    environment:
      MYSQL_DATABASE: DB
      MYSQL_PASSWORD: root
      MYSQL_ROOT_PASSWORD: root
    volumes:
      - mysql-volume:/var/lib/mysql
    ports:
      - 3066:3306
volumes:
  mongo-volume:
  mysql-volume:
  

# Run below to command to create container in docker platform.

docker-compose ps  (To list running containers)
docker-compose up (To install all containers)
docker-compose up -d (run container in Detached mode)

# Check list docker images created by docker-compose.yaml file

docker image ls

# How to Browse Final application.

http://localhost:8080



















