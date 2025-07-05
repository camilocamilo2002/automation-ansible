FROM python:3.10-slim

# Instala dependencias y paramiko
RUN apt-get update && apt-get install -y sshpass && \
    pip install ansible paramiko

WORKDIR /automation
ENTRYPOINT ["ansible-playbook"]
