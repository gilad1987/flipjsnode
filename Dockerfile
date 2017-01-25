FROM node:6.2.2
MAINTAINER Gilad Takoni

LABEL "version"="0.0.1"

# Set environment variables
#ENV NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib

RUN npm install -g  node-gyp  \
                    nodemon  \
                    pangyp \
                    gulp  \
                    pm2 \
                    && ln -s $(which pangyp) $(dirname $(which pangyp))/node-gyp\ \
                    && npm cache clear \
                    && node-gyp configure || echo ""

WORKDIR /var/www/app/current

COPY package.json /var/www/app/current/
RUN npm install

COPY . /var/www/app/current/