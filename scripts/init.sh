#!/bin/sh

. /scripts/zabbix_api.sh

echo "Login ke Zabbix API..."
AUTH=$(login)

echo "Auth Token: $AUTH"

echo "Create Host Group..."
GROUP_ID=$(curl -s -X POST http://zabbix-web:8080/api_jsonrpc.php \
-H 'Content-Type: application/json' \
-d "{
  \"jsonrpc\": \"2.0\",
  \"method\": \"hostgroup.create\",
  \"params\": {
    \"name\": \"Network Devices\"
  },
  \"auth\": \"$AUTH\",
  \"id\": 2
}" | jq -r '.result.groupids[0]')

echo "Create MikroTik Host..."
curl -s -X POST http://zabbix-web:8080/api_jsonrpc.php \
-H 'Content-Type: application/json' \
-d "{
  \"jsonrpc\": \"2.0\",
  \"method\": \"host.create\",
  \"params\": {
    \"host\": \"MikroTik-Switch\",
    \"interfaces\": [{
      \"type\": 2,
      \"main\": 1,
      \"useip\": 1,
      \"ip\": \"192.168.1.1\",
      \"dns\": \"\",
      \"port\": \"161\",
      \"details\": {
        \"version\": 2,
        \"community\": \"zabbix-snmp"
      }
    }],
    \"groups\": [{
      \"groupid\": \"$GROUP_ID\"
    }]
  },
  \"auth\": \"$AUTH\",
  \"id\": 3
}"

echo "DONE AUTO CONFIG "
