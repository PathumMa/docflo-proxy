FROM nginx:1.27-alpine

COPY nginx/templates/default.conf.template /etc/nginx/templates/default.conf.template
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]