# syntax=docker/dockerfile:1.4
FROM eclipse-temurin:17-jre
SHELL [ "/bin/bash", "-exc" ]

ARG REFINE_VERSION=3.8.1

WORKDIR /opt/openrefine
RUN <<EOT
  download_url="https://github.com/OpenRefine/OpenRefine/releases/download/${REFINE_VERSION}/openrefine-linux-${REFINE_VERSION}.tar.gz"
  curl -L "$download_url" | tar -xz --strip-components 1
EOT

ENTRYPOINT [ "/opt/openrefine/refine" ]
