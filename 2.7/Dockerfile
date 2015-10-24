FROM python:2.7

RUN groupadd -r hareau && useradd -r -g hareau --uid 1000 hareau

RUN apt-get update && \
    apt-get install -y python-dev gettext postgresql-client netcat && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/dev/conf && \
    mkdir -p /opt/dev/src && \
    mkdir -p /opt/dev/venv && \
    chown -R hareau:hareau /opt/dev

USER hareau
COPY docker-entrypoint.sh /opt/dev/

ENV PYTHON_EGG_CACHE /opt/dev/venv/.python-eggs

VOLUME ["/opt/dev/venv"]

ENTRYPOINT ["/opt/dev/docker-entrypoint.sh"]
