# Web preparation
FROM docker.io/node:alpine AS web

WORKDIR /repo

COPY web/ .

RUN npm ci
RUN npm run build

# API preparation
FROM docker.io/node:alpine AS api

WORKDIR /repo

COPY api/ .

RUN npm ci

RUN npm lint

# Assembly of all components
FROM docker.io/node:alpine AS assembled

WORKDIR /app

COPY --from=api /repo . 
COPY --from=web /repo/build/ public/

EXPOSE 8080:8080

CMD ["npm", "run", "start"]