#!/bin/bash

# Create NSSDB
certutil -d sql:$NSSDB --empty-password -N -f /dev/null 2> /dev/null
echo "Keystore created"

# Run the NSSDB updating utility in background
import_cert.sh $HOME &

sleep 2

CHROME_ARGS="--disable-gpu --headless --no-sandbox --dbus-stub --remote-debugging-address=$DEBUG_ADDRESS --remote-debugging-port=$DEBUG_PORT --user-data-dir=/data"

# Add extra options to Chrome from environment variable CHROME_OPTS
if [ -n "$CHROME_OPTS" ]; then
  CHROME_ARGS="${CHROME_ARGS} ${CHROME_OPTS}"
fi

# Start Chrome
exec sh -c "/usr/bin/google-chrome-unstable $CHROME_ARGS"

