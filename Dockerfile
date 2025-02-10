# Use the official Node.js image with Alpine as the base image
FROM node:20-alpine

# Install necessary dependencies
RUN apk add --no-cache curl

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and yarn.lock files to the container
COPY package.json yarn.lock ./

# Install the dependencies using yarn
RUN yarn install --production

# Copy the rest of the application files to the container
COPY . .

# Set a non-root user for security (use the existing `node` user)
USER node

# Expose the port your app will run on
EXPOSE 3000

# Command to run the application
CMD ["yarn", "start"]
