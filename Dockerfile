FROM node:alpine as builder
WORKDIR '/app'
COPY frontend/package.json .
RUN npm install
COPY ./frontend .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html