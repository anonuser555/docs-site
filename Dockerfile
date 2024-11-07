FROM docker.io/polinux/mkdocs

COPY docs /mkdocs/
COPY mkdocs.yaml /mkdocs/
