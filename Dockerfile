FROM python:3.10-bullseye
RUN useradd -mU mitmproxy
RUN apt-get update \
    && apt-get install -y --no-install-recommends gosu \
    && rm -rf /var/lib/apt/lists/*

COPY . /usr/local/bin/mitmproxysource
RUN pip install /usr/local/bin/mitmproxysource

VOLUME /home/mitmproxy/.mitmproxy

COPY ./release/docker/docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 8080 8081

CMD ["mitmproxy"]
