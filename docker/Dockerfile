FROM python:3.10-slim-bullseye

RUN mkdir /app
WORKDIR /app

COPY src/* /app/

ENTRYPOINT [ "python3", "main.py" ]
