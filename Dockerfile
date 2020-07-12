FROM node:12-alpine as builder
WORKDIR /app
COPY package.json ./
COPY yarn.lock ./
RUN yarn
COPY . .
RUN npm run build


FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html