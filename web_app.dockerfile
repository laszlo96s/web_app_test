# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the custom Nginx configuration file
COPY default.conf /etc/nginx/conf.d/

# Copy the HTML file to the Nginx root directory
COPY index.html /usr/share/nginx/html/

# Expose port 8080
EXPOSE 8080
