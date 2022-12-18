FROM python:3.10-slim-bullseye

RUN mkdir /app
WORKDIR /app
COPY src/* /app/
COPY requirements.txt /app/requirements.txt

RUN python3 -m pip install --upgrade pip
# Note we install requirements NOT test-requirements (this is a 'production' container)
RUN pip3 install -r requirements.txt


ENTRYPOINT [ "python3", "app.py" ]
