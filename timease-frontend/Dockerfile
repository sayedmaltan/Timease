# Set the base image
FROM node:current-slim

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies first
COPY package.json /app/

COPY public/ /app/public
COPY src/ /app/src
# Install all dependencies including react-router-dom
RUN npm install

# Expose the React development server port
EXPOSE 5173

# Command to start the React app with live reload
CMD ["npm", "run", "dev"]
# RUN npm i react-router-dom 