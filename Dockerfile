FROM node:16

# packages
RUN apt-get -y update
RUN apt-get -y install git
RUN apt-get -y install lua5.3

# app setup
ARG GIT_COMMIT
ENV GIT_COMMIT=$GIT_COMMIT

ENV NODE_ENV=production
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 8090
RUN chown -R node /usr/src/app
USER node
CMD ["npm", "start"]
