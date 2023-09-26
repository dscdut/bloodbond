FROM node:16

WORKDIR /home/app/
COPY package.json /home/app/
RUN npm install
COPY . /home/app/