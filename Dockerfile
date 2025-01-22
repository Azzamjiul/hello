# Use the official Node.js image for Windows
FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Set up working directory
WORKDIR /app

# Copy package files for installing dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Install Express for the server
RUN npm install express

# Expose the port
EXPOSE 3000

# Command to run the server
CMD ["node", "server.js"]