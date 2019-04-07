# Deploy the plantUML server to a Kubernetes cluster

The example manifests in this folder show you how to deploy the plantUML server to a Kubernetes cluster.

The `cert.yaml` & `ing.yaml` file are configured for a cluster in which it is possible to acquire automatically SSL certificates from [Let's Encrypt](https://letsencrypt.org/) using the [Cert Manager](https://github.com/jetstack/cert-manager).
