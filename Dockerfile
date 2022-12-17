FROM python:3.10-slim-bullseye)

mkdir /app
WORKDIR /app

COPY src/* /app/

ENTRYPOINT [ "python3", "main.py" ]