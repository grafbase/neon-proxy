curl --insecure --request POST \
  'https://postgres:grafbase@db.localtest.me:4444/sql' \
  --header 'Neon-Connection-String: postgres://postgres:grafbase@db.localtest.me:5432/postgres' \
  --header 'Neon-Raw-Text-Output: false' \
  --header 'Neon-Array-Mode: false' \
  --header 'Neon-Pool-Opt-In: true' \
  --header 'Content-Type: application/json' \
  --data-raw '{
      "query": "SELECT 1",
      "params": []
  }'