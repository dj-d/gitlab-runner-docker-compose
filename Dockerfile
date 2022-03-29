FROM gitlab/gitlab-runner:latest

LABEL MAINTAINER="djalba98"

RUN apt --quiet update --yes

# Install Docker
RUN apt --quiet install --yes ca-certificates curl gnupg lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt --quiet update --yes
RUN apt --quiet install --yes docker-ce docker-ce-cli containerd.io

# Added user to docker group
RUN usermod -aG docker gitlab-runner
RUN newgrp docker

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Service
RUN systemctl enable docker.service
RUN systemctl enable containerd.service