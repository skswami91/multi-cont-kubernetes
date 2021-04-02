FROM node:10-alpine3.9
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx:stable
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html
