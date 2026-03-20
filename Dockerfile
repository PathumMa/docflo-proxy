FROM nginx:1.27-alpine

COPY nginx/templates/default.conf.template /etc/nginx/templates/default.conf.template
COPY entrypoint.sh /entrypoint.sh

# Make executable AND remove CRLF if present (prevents /bin/sh\r issue)
RUN chmod +x /entrypoint.sh && sed -i 's/\r$//' /entrypoint.sh

EXPOSE 80

# Call through /bin/sh to avoid shebang edge cases
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]