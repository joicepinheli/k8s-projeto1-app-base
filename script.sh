#!/bin/bash

echo "building"

docker build -t joicemagda/kube-backend:1.0 backend/.
docker build -t joicemagda/kube-dabase:1.0 database/.

echo "Push"

docker push joicemagda/kube-backend:1.0
docker push joicemagda/kube-dabase:1.0

echo "Criando servicos no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Realizando os deployments..."

kubectl apply -f ./deployment.yml
