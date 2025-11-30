#! /bin/bash

sudo -i

sudo apt update -y

apt install docker.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo apt install docker-compose -y

mkdir -p /strapi
cd /strapi

cat <<EOF > docker-compose.yml
version: '3'
services:
  strapi:
    image: strapi/strapi
    container_name: strapi-app
    ports:
      - "1337:1337"
    volumes:
      - ./app:/srv/app
    environment:
      - DATABASE_CLIENT=sqlite
      - DATABASE_FILENAME=/srv/app/data.db
      - HOST=0.0.0.0
      - PORT=1337
    restart: unless-stopped  
EOF

sudo docker-compose up