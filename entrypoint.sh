#!/bin/sh
set -e

: "${BACKEND_UPSTREAM:=http://docflo-backend-uat.internal.blackbush-8cdbca41.southeastasia.azurecontainerapps.io}"

envsubst '${BACKEND_UPSTREAM}' \
  < /etc/nginx/templates/default.conf.template \
  > /etc/nginx/conf.d/default.conf

echo "NGINX configured with BACKEND_UPSTREAM=${BACKEND_UPSTREAM}"
exec nginx -g "daemon off;"