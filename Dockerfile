FROM docker.io/node:alpine as web

WORKDIR /repo

COPY web/ .

RUN npm i
RUN npm run build

FROM docker.io/node:alpine as api

WORKDIR /repo

COPY api/ .
COPY --from=web /repo/build/ public/

RUN npm i

EXPOSE 8080:8080

CMD ["npm", "run", "start"]