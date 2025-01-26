FROM nginx:latest

COPY nginx.conf /etc/nginx/nginx.conf

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

COPY start.sh /start.sh

RUN chmod +x start.sh

ENTRYPOINT ["/start.sh"]
