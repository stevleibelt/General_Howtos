# OpenSSL

## HowTos

### Exchange encrypted files

```bash
# Encrypt file
openssl rsautl -encrypt -inkey his_public_key.pem -pubin -in top_secret.txt -out top_secret.enc

# Decrypt file
openssl rsautl -decrypt -inkey my_private_key.pem -in top_secret.enc > top_secret.txt
```

### Create a pem file from a host name

```bash
HOSTNAME_WITH_PORT='www.bazzline.net:443'

openssl s_client -connect ${HOSTNAME_WITH_PORT} 2>/dev/null </dev/null |  sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ${HOSTNAME_WITH_PORT%:*}.pem;
```

### View pem files

```bash
# ref: https://unix.stackexchange.com/questions/696224/using-openssl-to-display-all-certificates-of-a-pem-file
# View a file containing one certificate
PEM_FILE_PATH="cert.pem"
openssl x509 -in "${PEM_FILE_PATH}" -noout -text

# View a chain or cert-bundle
PEM_FILE_PATH="cert-bundle.pem"
while openssl x509 -noout -text; do :; done < "${PEM_FILE_PATH}"
```

### View full certificate info

```bash
# ref: https://stackoverflow.com/a/34812039
HOSTNAME_WITH_PORT="www.bazzline.net:443"

openssl s_client -connect ${HOSTNAME_WITH_PORT} </dev/null 2>/dev/null | openssl x509 -inform pem -text
```

### Use pem/ca file file to verify

```bash
# Expected output: Verification: OK
HOSTNAME_WITH_PORT="www.bazzline.net:443"
PEM_FILE_PATH=my.pem
openssl s_client -connect ${HOSTNAME_WITH_PORT} -showcerts -CAfile ${PEM_FILE_PATH} </dev/null 2>/dev/null | grep ^Verification
```

## General about certificates

* Specified in RFC 2818
* `commonName` is deprecated and superseded by `subjectAltName`
  * if `subjectAltName` exists, `commonName` is not used
  * `subjectAltName` has to contain the value auf `commonName` too!

## Links

* [Encrypting and decrypting files with OpenSSL](https://opensource.com/article/21/4/encryption-decryption-openssl) - 20210429
* [RFC-2818](https://datatracker.ietf.org/doc/html/rfc2818)
