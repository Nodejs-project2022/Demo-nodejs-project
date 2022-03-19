FROM node:latest
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY package*.json /usr/src/app
RUN npm install -g latest
# Copy app source code
COPY . /usr/src/app
#Expose port and start application
EXPOSE 8080
CMD [ "npm", "start" ]
