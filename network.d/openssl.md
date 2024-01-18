# OpenSSL

## HowTos

### Exchange encrypted files

```bash
#encrypt file
openssl rsautl -encrypt -inkey his_public_key.pem -pubin -in top_secret.txt -out top_secret.enc

#decrypt file
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
# view a file containing one certificate
PEM_FILE_PATH="cert.pem"
openssl x509 -in "${PEM_FILE_PATH}" -noout -text

# view a chain or cert-bundle
PEM_FILE_PATH="cert-bundle.pem"
while openssl x509 -noout -text; do :; done < "${PEM_FILE_PATH}"
```

## Links

* [Encrypting and decrypting files with OpenSSL](https://opensource.com/article/21/4/encryption-decryption-openssl) - 20210429
