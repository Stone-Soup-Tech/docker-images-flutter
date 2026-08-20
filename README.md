> [!IMPORTANT]
> This repostiry will stop updating images starting May 1st 2026 due to Cirrus Labs winding down operations after an acquisition.

# Docker Images for [Flutter](https://flutter.dev/)

[![Build Status][build_badge]][build_link]

You can either [use it in CI](https://cirrus-ci.org/examples/#flutter) or run locally via Docker:

```bash
docker run --rm -it -v ${PWD}:/build --workdir /build ghcr.io/cirruslabs/flutter:stable flutter test
```

The example above simply mount current working directory and runs `flutter test`

## GitHub Container Registry

Images are published by GitHub Actions to:

```text
ghcr.io/stone-soup-tech/flutter
```

[build_badge]: https://api.cirrus-ci.com/github/cirruslabs/docker-images-flutter.svg
[build_link]: https://cirrus-ci.com/github/cirruslabs/docker-images-flutter
