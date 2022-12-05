#!/bin/bash
kubectl delete -f training-portal.yaml
kubectl delete -f tapworkshop-developers.yaml
kubectl delete -f tapworkshop-operators.yaml
kubectl apply -f tapworkshop-developers.yaml
kubectl apply -f tapworkshop-operators.yaml
kubectl apply -f training-portal.yaml
sleep 30s
kubectl get trainingportal
