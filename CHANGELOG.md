# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- markdownlint-configure-file { "MD024": { "allow_different_nesting": true } } -->

## [2.1.0] 2022-09-20

### Added

- Add cron as sidecar container.

## [2.0.0] 2022-07-15

### Added

- Add [Dependabot](https://github.com/dependabot) in CI.
- This CHANGELOG file.

### Changed

- Upgrade to [Træfik](https://traefik.io/) [v2](https://doc.traefik.io/traefik/migration/v1-to-v2/) syntax.

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

[2.1.0]: https://github.com/solution-libre/docker-dolibarr/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/solution-libre/docker-dolibarr/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/solution-libre/docker-dolibarr/compare/v0.1.1...v1.0.0
[0.1.1]: https://github.com/solution-libre/docker-dolibarr/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/solution-libre/docker-dolibarr/releases/tag/v0.1.0
