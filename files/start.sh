#!/usr/bin/env bash

rm -f "/app/authorization.properties"

# Add tenant info:
echo "[${DYNATRACE_ACTIVEGATE_TENANT}]" >> "/app/authorization.properties"
echo "mainTenant = true" >> "/app/authorization.properties"
echo "tenantToken = ${DYNATRACE_ACTIVEGATE_TENANT_TOKEN}" >> "/app/authorization.properties"
echo "authToken = ${DYNATRACE_ACTIVEGATE_AUTH_TOKEN}" >> "/app/authorization.properties"

# Add Port:
echo "[com.compuware.apm.webserver]" >> "/app/custom.properties"
echo "port-ssl = ${PORT}" >> "/app/custom.properties"


ln -sfn "/app/authorization.properties" "/app/dynatrace/gateway/config/authorization.properties"
ln -sfn "/app/custom.properties" "/app/dynatrace/gateway/config/custom.properties"
ln -sfn "/app/launcheruserconfig.conf" "/app/dynatrace/gateway/config/launcheruserconfig.conf"

/app/dynatrace/gateway/bin/dynatracegateway -config /app/dynatrace/gateway/config/dynatracegateway.ini
