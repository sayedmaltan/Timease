#LABEL authors="eslam"

FROM node:current-slim
# Set the working directory
WORKDIR /app

# Install dependencies
COPY package.json package-lock.json /app/
RUN apt update && apt install npm -y && npm i

# Copy the source code
COPY . /app
# Expose the React development server port
EXPOSE 5173

# Command to start the React app with live reload
CMD ["npm", "run","dev","--host"]

