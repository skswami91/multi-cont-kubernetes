FROM node:10-alpine3.9
RUN chmod a+x /app/node_modules/.bin/react-scripts
WORKDIR '/app'
RUN npm install react-scripts -g --silent
COPY ./package.json ./
RUN npm install
COPY ./ ./
CMD ["npm", "run", "start"]
