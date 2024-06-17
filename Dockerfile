FROM docker.io/node:alpine

COPY api /app

COPY web/build /app/public

WORKDIR /app

EXPOSE 8080:8080

CMD ["npm", "run", "start"]