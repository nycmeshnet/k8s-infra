#!/bin/bash

certbot_domain="{{ certbot_get_cert_for_domain }}"
full_chain_path="/etc/letsencrypt/live/$certbot_domain/fullchain.pem"
priv_key_path="/etc/letsencrypt/live/$certbot_domain/privkey.pem"
CERTS_DIR="/etc/haproxy/ssl_internal/"

# Only update the certs if they exist, otherwise fail here before something broken is rolled out
if [ ! -f "$full_chain_path" ] || [ ! -f "$priv_key_path" ]; then
    exit 1
else
    cat $full_chain_path > $CERTS_DIR/lb.pem
    cat $priv_key_path > $CERTS_DIR/lb.pem.key
fi

# Reload the service
service haproxy reload
