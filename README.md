# nats-k8s-leafnode-websocket
Demonstration of how to connect a NATS leafnode using websockets. Assumes a working K8s server is available.

* Download nats-server binary from https://github.com/nats-io/nats-server/releases
* Execute `./create-certs.sh` to create the necessary keys, certificates and import into K8s as secrets
* Install nats in K8s with leaf node and websockets enabled `helm install nats nats/nats -f values.yml`
* Create a NodePort service to expose NATS for demonstration purposes `kubectl apply -f nats-public.yaml`
* Start the leaf node server configured to connect to the main NATS server

