<a href="https://hub.docker.com/repository/docker/djalba98/gitlab-runner-docker-compose">
        <img src="https://img.shields.io/docker/pulls/djalba98/gitlab-runner-docker-compose.svg?style=flat-square&color=brightgreen&logo=docker&logoColor=white"
            alt="Pulls"></a>

# Docker Image for GitLab Runner with Docker Compose
Docker image based on gitlab/gitlab-runner for GitLab Runner

## Last version:
```sh
docker pull djalba98/gitlab-runner-docker-compose:latest
```

## Usage in Docker Compose
```
version: '3.5'

services:
  gitlab-runner:
    image: djalba98/gitlab-runner-docker-compose:latest
    restart: always
    container_name: gitlab-runner

    volumes:
      - config:/etc/gitlab-runner
      - /var/run/docker.sock:/var/run/docker.sock

volumes:
  config:
    driver: local
```