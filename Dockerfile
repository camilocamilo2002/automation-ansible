FROM python:3.10-slim

RUN apt-get update && apt-get install -y sshpass && \
    pip install ansible paramiko

WORKDIR /automation

CMD ["/bin/bash"]
