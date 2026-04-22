FROM nginx:stable-alpine
COPY index.html about.html contact.html /usr/share/nginx/html/
EXPOSE 80
