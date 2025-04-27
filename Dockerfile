FROM ubuntu:latest
LABEL authors="jolmes"

ENTRYPOINT ["top", "-b"]