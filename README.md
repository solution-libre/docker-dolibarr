# Dolibarr with Docker Compose

<!-- markdownlint-disable-next-line MD001 -->
#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
3. [Usage](#usage)
4. [Reference](#reference)
5. [Development](#development)
6. [Contributors](#contributors)

## Description

[Docker Compose](https://docs.docker.com/compose/) setup for starting [Dolibarr](https://www.dolibarr.org/)
with [Træfik](https://traefik.io/).

The [main Compose file](https://github.com/solution-libre/docker-dolibarr/blob/main/tuxgasy/docker-compose.yml),
which is present in the `tuxgasy` folder, is a copy of the [Garcia Michel](https://github.com/tuxgasy)
work that maintains great [Docker images of Dolibarr](https://github.com/tuxgasy/docker-dolibarr).

## Setup

```sh
cd /opt
git clone https://github.com/solution-libre/docker-dolibarr.git dolibarr
cd dolibarr
cp -r .secrets.dist .secrets
cp tuxgasy/secrets/* .secrets/
```

Declare environment variables or copy the `.env.dist` to `.env` and adjust its values.

Change the value of the secrets in the `.secrets` folder.

Register a domain like 'dolibarr.domain.tld'.

## Usage

```sh
cd /opt/dolibarr
docker compose up -d
```

## Reference

See [REFERENCE.md](./REFERENCE.md)

## Development

[Solution Libre](https://www.solution-libre.fr)'s repositories are open projects,
and community contributions are essential for keeping them great.

[Fork this repo on GitHub](https://github.com/solution-libre/docker-dolibarr/fork)

## Contributors

The list of contributors can be found at: <https://github.com/solution-libre/docker-dolibarr/graphs/contributors>
