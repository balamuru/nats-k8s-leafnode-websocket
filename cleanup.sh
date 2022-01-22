#!/bin/bash

rm -rf *.pem
kubectl delete secret nats-ca nats-server-tls
helm delete nats

