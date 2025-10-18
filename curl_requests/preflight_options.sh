#!/bin/bash
endpoints=("/api/v1/user/profile" "/api/v1/orders/12345" "/api/v1/wallet")
origin="https://evil.example"
for path in "${endpoints[@]}"; do
  echo "---- PATH: $path ----"
  /usr/bin/curl -s -I -X OPTIONS -H "Origin: $origin" -H "Access-Control-Request-Method: GET" "https://web3api.binance.com${path}" \
    | /bin/grep -i -E "Access-Control-Allow-Origin|Access-Control-Allow-Credentials|Vary|Access-Control-Allow-Methods" || true
  echo
done
