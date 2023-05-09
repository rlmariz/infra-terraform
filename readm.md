## Terraform Commands
    terraform init 
    terraform plan
    terraform plan -var-file="terraform.tfvars"
    terraform apply -var-file="terraform.tfvars"


## Create Remote State
>Create bucket with local state

    ren backend.tf to backend.tf_
    terraform init
    terraform apply -var-file="terraform.tfvars"

>Trasfer local state to remote bucket

    ren backend.tf_ to backend.tf`
    set created bucket name in backend.tf
    terraform init`

## install cubctl
    gcloud components install kubectl
    gke-gcloud-auth-plugin --version
    gcloud container clusters get-credentials --region <region> <cluster name>
    kubectl version

gcloud container clusters get-credentials --region southamerica-east1 services-gke-cluster

## Kubernetes Commands
    kubectl get pods
    kubectl get nodes
    kubectl get namespaces
    kubectl get sc
    kubectl get storageclasses.storage.k8s.io

kubectl create -f sc-database.yaml
kubctl get deployments

kubectl describe pod

Check the pod description – kubectl describe pod
Check the logs – kubectl logs mypod --all-containers

kubectl create secret generic sqlserver-2022-secret --from-literal=SA_PASSWORD="data@2022"
kubectl create -f sqlserver-2022-deploy.yaml
kubectl apply -f sqlserver-2022-deploy.yaml
kubectl delete deployment -f sqlserver-2022-deploy.yaml
kubectl get pods -l app=ms-sqlserver-2022 -o wide

kubectl delete -f repositoriodfe-deploy.yaml

kubectl get pods -l app=ms-sqlserver-2022 -o wide

kubectl exec -ti repositoriodfe-78fbb74d9b-c42fl -- /bin/bash

kubctl get services

kubectl exec -ti repositoriodfe-78fbb74d9b-c42fl -- /bin/bash
kubectl logs repositoriodfe-78fbb74d9b-c42fl  --all-containers

kubectl rollout undo deploy repositoriodfe -n default

gcloud compute scp sc-databases.yaml <your cloud>:/home/<user-name>/data/hostpath-pvc <your zone>

kubectl cp RepositorioDFe-Full-20221009_160000.Bak sqlserver-2022-deployment-5544586d66-tlvrz:/var/opt/mssql


Kubectl create secret generic appsettings-repositoriodfe –from-file="./appsettings.json"
kubectl create secret generic appsettings-repositoriodfe --from-file=./appsettings.json

kubectl delete pod repositoriodfe-78fbb74d9b-c42fl