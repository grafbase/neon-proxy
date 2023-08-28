# Local Neon Proxy

A wrapper to get a docker image from the Neon proxy for internal test use.

## Building

```console
docker build . -t grafbase/neon-proxy:latest^C
```

## Publishing

```console
docker push grafbase/neon-proxy:latest
```

## Usage

See `docker-compose.yml`, `test-project` and `scripts/local.sh`.
