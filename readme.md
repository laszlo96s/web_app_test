# Building and running this docker compose project

This is an overview on how to build and run this docker compose project that sets up an Nginx server to serve a static HTML page.

## Step 1: Project directory

Ensure you have the following files in your project directory:

- `web_app.dockerfile`
- `default.conf`
- `index.html`
- `docker-compose.yml`

### web_app.dockerfile:

```Dockerfile
# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the custom Nginx configuration file
COPY default.conf /etc/nginx/conf.d/

# Copy the HTML file to the Nginx root directory
COPY index.html /usr/share/nginx/html/
```
### nginx - default.conf:

```nginx
server {
    listen 8060;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html;
    }
}
```

### index.html:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>Hello World</h1>
</body>
</html>
```

### docker-compose.yml:

```yml
version: '3'
services:
  web:
    build:
      context: .
      dockerfile: web_app.dockerfile
    ports:
      - "8080:8060"
    command: ["nginx", "-g", "daemon off;"]
```

## Step 2: Building the docker image from .dockerfile:

Navigate to your project directory in the terminal and run the following command to build the Docker image without using the cache:
docker-compose build
you can use --no-cache to rebuild a new image if the dockerfile is modified recently

## Step 3: Running docker compose up

After building the image, run the following command to start the Docker container:
docker-compose up
use -d (detached mode), if you don't want the output to be logged out to the terminal

## Step 4: Access the application

Open your web browser and navigate to http://localhost:8080 to see your "Hello World" page served by Nginx.
