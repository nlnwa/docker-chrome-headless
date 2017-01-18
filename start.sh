#!/bin/bash

# Run the NSSDB updating utility in background
import_cert.sh $HOME &

# Start Chrome
exec /usr/bin/google-chrome-unstable \
       --disable-gpu \
       --headless \
       --ignore-certificate-errors \
       --disable-web-security \
       --allow-running-insecure-content \
       --proxy-server=$PROXY \
       --remote-debugging-address=0.0.0.0 \
       --remote-debugging-port=9222 \
       --user-data-dir=/data

