FROM node:17-alpine as builder
WORKDIR /app/portfolio
COPY . /app/portfolio
RUN yarn
RUN yarn build

FROM nginx:1.21
COPY --from=builder ./app/portfolio/nginx.conf /etc/nginx/
COPY --from=builder /app/portfolio/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]