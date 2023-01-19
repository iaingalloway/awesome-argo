#!/bin/bash

# create the cluster
kind create cluster --config ./kind-config.yaml

# create the storage class


# apply argo
kubectl create namespace argocd
kubectl apply --namespace argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# install awesome app of apps
kubectl apply --namespace argocd -f ./awesome-applications.yaml

# get the secret
kubectl get secret argocd-initial-admin-secret --namespace argocd -o jsonpath="{.data.password}" | base64 -d; echo

echo 'Browse to http://localhost:8080 and use username admin.'