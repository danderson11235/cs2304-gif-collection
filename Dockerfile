FROM node:alpine
RUN apk add --no-cache curl
WORKDIR /usr/local/app
COPY package.json .
RUN npm install
COPY . .
HEALTHCHECK --interval=10s --retries=3 CMD curl -f http://localhost:3000 || exit 1
CMD [ "node", "app.js" ]