#!/bin/bash
set -e

# Add the admin user
echo "adding admin user..."
esusers useradd $ES_USER -p $ES_PASS -r admin

chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data
exec gosu elasticsearch "$@"

exec /docker-entrypoint.sh $@
