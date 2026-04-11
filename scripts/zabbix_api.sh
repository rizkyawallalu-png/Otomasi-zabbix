#!/bin/sh

ZABBIX_URL="http://zabbix-web:8080/api_jsonrpc.php"
USERNAME="${ZABBIX_USER}"
PASSWORD="${ZABBIX_PASS}"

login() {
  curl -s -X POST $ZABBIX_URL \
  -H 'Content-Type: application/json' \
  -d "{
    \"jsonrpc\": \"2.0\",
    \"method\": \"user.login\",
    \"params\": {
      \"username\": \"$USERNAME\",
      \"password\": \"$PASSWORD\"
    },
    \"id\": 1
  }" | jq -r '.result'
}
