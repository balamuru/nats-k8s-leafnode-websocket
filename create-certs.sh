#!/bin/bash

rm -rf *.pem
mkcert -install
cp `mkcert -CAROOT`/* .
mkcert -cert-file server-cert.pem -key-file server-key.pem carbon localhost ::1
mkcert -client -cert-file client-cert.pem -key-file client-key.pem carbon localhost ::1 email@localhost

kubectl delete secret nats-ca nats-server-tls
kubectl create secret generic nats-ca --from-file=tls.key=rootCA-key.pem --from-file=tls.crt=rootCA.pem --from-file=ca.crt=rootCA.pem
kubectl create secret generic nats-server-tls --from-file=tls.key=server-key.pem --from-file=tls.crt=server-cert.pem --from-file=ca.crt=rootCA.pem

