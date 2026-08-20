# Docker Images for [Flutter](https://flutter.dev/)

[![Publish Flutter images](https://github.com/Stone-Soup-Tech/docker-images-flutter/actions/workflows/publish.yml/badge.svg)](https://github.com/Stone-Soup-Tech/docker-images-flutter/actions/workflows/publish.yml)

This is a Stone Soup Tech fork of [cirruslabs/docker-images-flutter](https://github.com/cirruslabs/docker-images-flutter). The upstream repository stopped updating images starting May 1, 2026 due to Cirrus Labs winding down operations after an acquisition.

Images are built with GitHub Actions and published to GitHub Container Registry.

## Usage

Use the image in CI or run it locally with Docker:

```bash
docker run --rm -it -v ${PWD}:/build --workdir /build ghcr.io/stone-soup-tech/flutter:stable flutter test
```

The example above mounts the current working directory and runs `flutter test`.

## GitHub Container Registry

Images are published to:

```text
ghcr.io/stone-soup-tech/flutter
```

Published tags include:

```text
latest
stable
beta
<flutter-version>
```

## Version Updates

The Flutter version matrix lives in `.github/workflows/publish.yml`.

`.github/workflows/check_flutter_versions.yml` runs `scripts/update_flutter_versions.sh` on a schedule and opens a pull request when Flutter stable or beta changes.
