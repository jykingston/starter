FROM node:16-alpine AS cache
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

FROM node:16-alpine AS app
WORKDIR /app
COPY --from=cache /app/node_modules ./node_modules
COPY . .
CMD ["node", "index.js"]
