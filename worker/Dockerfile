FROM node:12-slim

ARG GIT_COMMIT

WORKDIR /usr/src

# Create man folders which are required by postgres
RUN seq 1 8 | xargs -I{} mkdir -p /usr/share/man/man{}

# Install dependencies
RUN apt-get update \
      && apt-get install -y git python build-essential postgresql-client

# Install and build culturestake app
RUN git clone https://github.com/lazaruslabs/culturestake.git app \
      && cd app \
      && git checkout --quiet ${GIT_COMMIT}

WORKDIR /usr/src/app

# Prepare variables
COPY .env .

RUN npm ci \
      && npm run build

# Remove unneeded dependencies
RUN apt-get purge -y --auto-remove build-essential

WORKDIR /usr/src/app

ENV WORKER true

COPY worker/run.sh .

RUN chmod +x run.sh

ENTRYPOINT ["/usr/src/app/run.sh"]
