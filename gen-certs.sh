#!/bin/bash
set -euo pipefail

cd certs;

HOST="localhost";
CRT="$HOST.crt";
KEY="$HOST.key";
CRT_DER="$CRT.der";
KEY_DER="$KEY.der";

# Generate KEY and CRT
openssl req -x509 \
    -newkey rsa:4096 \
    -keyout "$KEY" \
    -out "$CRT" \
    -days 365 \
    -sha256 \
    -nodes \
    --subj '/CN=localhost/' \
    -addext "subjectAltName=DNS:localhost";

# Convert PEM into DER
openssl rsa -in "$KEY" -out "$KEY_DER" -outform DER;
openssl x509 -in "$CRT" -out "$CRT_DER" -outform DER;

# Generate sha256 fingerprint
cat "$CRT_DER" | openssl dgst -sha256 > fingerprint.hex;

cd -;