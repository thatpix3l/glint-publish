VERSION 0.8

# Web preparation
web:
    FROM docker.io/node:alpine
    
    WORKDIR /repo
    
    COPY modules/web .
    
    RUN npm ci
    RUN npm run build
    
    SAVE ARTIFACT ./build /build

# API preparation
api:
    FROM docker.io/node:alpine
    
    WORKDIR /repo
    
    COPY modules/api .
    
    RUN npm ci
    
    SAVE ARTIFACT . /build

# Assembly of all components
image:
    FROM docker.io/node:alpine
    
    WORKDIR /app
    
    COPY +api/build . 
    COPY +web/build public
    
    CMD ["npm", "run", "start"]

image-save:
    FROM +image
    SAVE IMAGE glint:latest

image-push:
    FROM +image
    SAVE IMAGE --push glint:latest