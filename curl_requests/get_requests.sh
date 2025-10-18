#!/bin/bash
endpoints=("/" "/api/v1/user/profile")
origin="https://evil.example"
for path in "${endpoints[@]}"; do
  echo "---- PATH: $path ----"
  /usr/bin/curl -s -I -H "Origin: $origin" "https://web3api.binance.com${path}" \
    | /bin/grep -i -E "Access-Control-Allow-Origin|Access-Control-Allow-Credentials|Vary|Access-Control-Allow-Methods" || true
  echo
done
