FROM ghcr.io/stone-soup-tech/android-sdk:37.0

LABEL org.opencontainers.image.source=https://github.com/Stone-Soup-Tech/docker-images-flutter
USER root

ARG flutter_version

ENV FLUTTER_HOME=/opt/sdks/flutter \
    FLUTTER_VERSION=$flutter_version
ENV FLUTTER_ROOT=$FLUTTER_HOME
ENV PATH="${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin"

RUN git clone --depth 1 --branch "${FLUTTER_VERSION}" https://github.com/flutter/flutter.git "${FLUTTER_HOME}" \
    && yes | flutter doctor --android-licenses \
    && flutter precache --android \
    && flutter doctor
