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

RUN npm run lint

# Assembly of all components
FROM docker.io/node:alpine AS assembled

WORKDIR /app

COPY --from=api /repo . 
COPY --from=web /repo/build/ public/

CMD ["npm", "run", "start"]