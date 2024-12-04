FROM node:16-alpine AS cache
WORKDIR /app
RUN npm ci

FROM node:16-alpine AS app
WORKDIR /app
CMD ["node", "index.js"]
