#!/bin/bash
docker-compose up -d
echo "[31;1m <INFO> Wait 15 seconds to initiate MySQL Database ...[0m"
sleep 15
echo "[31;1m <INFO> Checking MySQL status ...[0m"
docker logs mysql | grep "Entrypoint"
echo "[31;1m <INFO> Checking Fluentd status ...[0m"
docker logs fluentd | tail -n 10
echo "[32;1m <INFO> 1st process to insert 999 records in 'myweb.search_test' table ...[0m"
docker exec mysql /app/gen-data.sh &
jobs
sleep 10
echo "[31;1m <INFO> Checking Fluentd status ...[0m"
docker exec fluentd ls /tmp/buffer
echo "[32;1m <INFO> update 3 records in 'myweb.search_test' table ...[0m"
docker exec mysql /app/update-data.sh
sleep 10
docker logs fluentd | grep --color "update"
echo "[31;1m <INFO> 2nd process to insert 999 records in 'myweb.search_test' table ...[0m"
docker exec mysql /app/gen-data.sh &
jobs
sleep 10
echo "[31;1m <INFO> 3rd process to insert 999 records in 'myweb.search_test' table ...[0m"
docker exec mysql /app/gen-data.sh &
jobs
sleep 10
echo "[32;1m <INFO> update 6 records in 'myweb.search_test' table ...[0m"
docker exec mysql /app/update-data.sh
sleep 10
docker logs fluentd | grep --color "update"
sleep 10
docker exec fluentd ls /tmp/buffer
echo "[35;1m <INFO> show fluentd output gz files ...[0m"
sleep 10 
if [ "$(which tree)" != "" ]; then
  tree fluentd/output
else
  ls -alR fluentd/output
fi
jobs
sleep 10 
docker-compose down
