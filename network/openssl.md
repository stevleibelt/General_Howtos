# Exchange encrypted files

````
#encrypt file
openssl rsautl -encrypt -inkey his_public_key.pem -pubin -in top_secret.txt -out top_secret.enc

#decrypt file
openssl rsautl -decrypt -inkey my_private_key.pem -in top_secret.enc > top_secret.txt
````

# Links

* [Encrypting and decrypting files with OpenSSL](https://opensource.com/article/21/4/encryption-decryption-openssl) - 20210429
