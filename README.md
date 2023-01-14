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

The Docker Compose described above, will go and create a container named "```gitlab-runner```" in which there will be an instance of Gitlab Runners.

To run Docker Compose we will use the following commands.

```shell
# Run Docker Compose
docker-compose up -d

# Stop Docker Compose
docker-compose down

# Stop Docker Compose and remove volumes
docker-compose down -v
```

----

***Remember*** 

*Add the user who is going to use the runners to the "docker" group on the system.*

----
## Register GitLab Runner

Enter into gitlab-runner container

```shell
docker exec -it gitlab-runner /bin/bash
```
Now you need to "register" the GitLab Runner. So we are going to go and connect this Runner with our project.

Run the following command to start recording

```shell
gitlab-runner register
```

Now enter the required information

```shell
$ Enter the GitLab instance URL (for example, https://gitlab.com/):
  ENTER THE URL GIVEN IN THE EXAMPLE OR ENTER URL OF YOUR GITLAB INSTANCE, IF YOU HAVE A SELF-HOSTED INSTANCE

$ Enter the registration token:
  ENTER REGISTRATION TOKEN

$ Enter a description for the runner:
  ENTER A SYMBOLIC NAME, TO IDENTIFY THE RUNNER

$ Enter tags for the runner (comma-separated):
  ENTER A NAME (POSSIBLY UNIQUE) THAT WILL IDENTIFY THE RUNNER IN THE PIPELINE CONFIGURATION FILE

$ Enter optional maintenance note for the runner:
  YOU CAN SKIP THIS

$ Enter an executor: custom, docker+machine, kubernetes, docker, docker-ssh, parallels, shell, ssh, virtualbox, docker-ssh+machine:
  CHOOSE AN EXECUTOR (IN THIS CASE YOU MUST USE shell)

```

To get the **registration token**, you have to go to (your GitLab project repository) _Settings_ > _CI/CD_ > _Runners_ > _Specific runners _> _Set up a specific runner for a project_
