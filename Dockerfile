FROM node:latest
# Create app directory
WORKDIR /Project/Demo-nodejs-project
# Install app dependencies
COPY package*.json ./
RUN npm install -g latest
# Copy app source code
COPY . .
#Expose port and start application
EXPOSE 8080
CMD [ "npm", "start" ]
