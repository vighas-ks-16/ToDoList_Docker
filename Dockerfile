# Use an optimized Node.js Alpine base image
FROM node:20-alpine

# Set environment variable for production
ENV NODE_ENV=production

# Install dependencies for debugging
RUN apk add --no-cache curl

# Set the working directory
WORKDIR /app

# Copy only necessary files
COPY package.json yarn.lock ./

# Install production dependencies
RUN yarn install --production

# Copy the rest of the application files
COPY . .

# Set a non-root user for security
RUN adduser -D node
USER node

# Expose the required port
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]
