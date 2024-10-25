# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- markdownlint-configure-file { "MD024": { "siblings_only": true } } -->

## [5.0.0] 2024-10-25

### Changed

- Replaced [tuxgasy/dolibarr](https://hub.docker.com/r/tuxgasy/dolibarr) image by the new
[offical image](https://hub.docker.com/r/dolibarr/dolibarr)
- Renamed `docker-volumes` folder in `volumes`
- [GitLab of Solution Libre](https://usine.solution-libre.fr/docker/dolibarr) is now the primary repository

## [4.0.0] 2023-09-20

### Added

- Support of memcached
- Support of Xdebug

### Changed

- Use Docker Compose inclusion instead of `COMPOSE_FILE` env var
- Use an image built for Dolibarr instead of Tuxgasy image

## [3.2.1] 2023-08-24

### Changed

- Rename the `compose.tuxgasy.override.yml` file to `compose.tuxgasy.override.yaml`

### Fixed

- Bad secret names for cron

## [3.2.0] 2023-08-23

### Changed

- Rename the `docker-compose.*.yml` files to `compose.*.yaml`
- Use [`extends` attribute](https://docs.docker.com/compose/compose-file/05-services/#extends) to refactor dolibarr and
  cron services

### Fixed

- Set cron secrets files in the environment variables of cron service

## [3.1.0] 2023-04-19

### Changed

- Use secret files for Cron secrets

### Removed

- SMTPd sidecar container

## [3.0.0] 2022-10-26

### Added

- Script to merge Tuxgasy work.

### Changed

- Use PostgreSQL instead of MySQL. Please follow [this process](https://wiki.dolibarr.org/index.php?title=FAQ_Migrate_my_Mysql_database_to_PostgreSQL).

## [2.1.0] 2022-09-20

### Added

- Add cron as sidecar container.

## [2.0.0] 2022-07-15

### Added

- Add [Dependabot](https://github.com/dependabot) in CI.
- This CHANGELOG file.

### Changed

- Upgrade to [Traefik](https://traefik.io/) [v2](https://doc.traefik.io/traefik/migration/v1-to-v2/) syntax.

## [1.0.0] 2022-07-15

### Added

- Add DOLI_URL_ROOT environment variable

### Changed

- Replace CI markdown check.
- Use docker compose plugin in example.
- Restart for Dolibarr and MySQL service.

### Fixed

- Fix URL in README

## [0.1.1] 2022-06-03

### Fixed

- Add Traefik mention on README.
- Fix LICENSE file.

## [0.1.0] 2022-04-23

### Added

- Docker-compose setup for starting Dolibarr with Træfik.

[5.0.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v4.0.0...v5.0.0
[4.0.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v3.2.1...v4.0.0
[3.2.1]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v3.2.0...v3.2.1
[3.2.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v3.1.0...v3.2.0
[3.1.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v3.0.0...v3.1.0
[3.0.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v2.1.0...v3.0.0
[2.1.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v2.0.0...v2.1.0
[2.0.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v1.0.0...v2.0.0
[1.0.0]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v0.1.1...v1.0.0
[0.1.1]: https://usine.solution-libre.fr/docker/dolibarr/-/compare/v0.1.0...v0.1.1
[0.1.0]: https://usine.solution-libre.fr/docker/dolibarr/-/releases/v0.1.0
