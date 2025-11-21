# ---------------------------
# STAGE 1: Build Flutter Web
# ---------------------------
FROM ghcr.io/cirruslabs/flutter:stable AS build

WORKDIR /app
COPY . .

RUN flutter config --enable-web

# Build release web
RUN flutter build web --release

# --------------------------------
# STAGE 2: NGINX para servir la app
# --------------------------------
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/build/web /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
