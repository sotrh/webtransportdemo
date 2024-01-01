# Notes

<https://letsencrypt.org/>

## Certificate stuff

For the key (let assume rsa) - as PEM is default following commands are equal:

```bash
openssl rsa -in <file_with_key> -out <new_der_key_file> -outform DER
openssl rsa -in <file_with_key> -inform PEM -out <new_der_key_file> -outform DER
```

For the certificate - also two equal forms :

```bash
openssl x509 -in <cert_file> -out <new_der_cert> -outform DER
openssl x509 -in <cert_file> -inform PEM -out <new_der_cert> -outform DER
```

## Python Chrome certificate instructions

<https://github.com/GoogleChrome/samples/blob/gh-pages/webtransport/webtransport_server.py>

## More stuff

```
mkdir ssl_certs && cd ssl_certs && openssl req -x509 -newkey rsa:4096 -keyout server.key -out server.crt -days 365 -sha256 -nodes --subj '/CN=localhost/' && cd -
```
