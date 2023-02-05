#! /bin/bash
timedatectl set-timezone Asia/Seoul

cd ~

install_docker() {
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh
}

install_docker_compose() {
  mkdir -p ~/.docker/cli-plugins/
  curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

  chmod +x ~/.docker/cli-plugins/docker-compose
  cat <<EOF > docker-compose.yml
version: '3.7'
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
EOF
  docker compose up -d
}

install_docker
install_docker_compose