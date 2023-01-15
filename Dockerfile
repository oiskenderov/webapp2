# syntax=docker/dockerfile:1
FROM python:3.7-alpine@sha256:78fa3f1c8454d6042c8e75ee84aece28297141f88c600c3f831f5f0fbd0ae381
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
CMD ["flask", "run"]
