## Install kubectl
>https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl

    gcloud components install kubectl
    gke-gcloud-auth-plugin --version
    gcloud container clusters get-credentials --region <region> <cluster name>
    kubectl version
    -----
    gcloud container clusters get-credentials --region southamerica-east1 services-gke-cluster

## Kubernetes Commands
    kubectl get pods
    kubectl get nodes
    kubectl get namespaces
    kubectl get sc
    kubectl get storageclasses.storage.k8s.io
    kubectl get pv,pvc,sc
    kubectl get <service, pod, secret, etc> <name> -o yaml
    kubectl describe node

## Ingress Controller
> https://kubernetes.github.io/ingress-nginx/

    kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user $(gcloud config get-value account)
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.4.0/deploy/static/provider/cloud/deploy.yaml
    ----
    kubectl create clusterrolebinding cluster-admin-binding --clusterrole cluster-admin --user rlmariz@gmail.com
    kubectl get services -n ingress-nginx

## StorageClass
    kubectl apply -f sc-pd-balanced.yaml

## SQL-2022
    gcloud compute disks create sqlserver-2022-pvc --size 30G --type pd-balanced --zone southamerica-east1-a
    kubectl apply -f sqlserver-2022-pvc.yaml
    kubectl apply -f sqlserver-2022-secret.yaml
    kubectl apply -f sqlserver-2022-deploy.yaml
    kubectl apply -f sqlserver-2022-service.yaml

> Preexisting PD
https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd

## Copy Files
    kubectl cp Wig_Eunapolis.bak sqlserver-2022-76f9d5f7c6-xw2dn:/var/opt/mssql

## Install Helm
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh

## Kubernetes-Dashboard

>https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

    gcloud config config-helper --format=json
    kubectl proxy
    http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy

obs: Pasting the access token in the field provided will gain you entry to the dashboard


kubectl apply -f kubernetes-dashboard-service-account.yaml
gcloud container clusters get-credentials --region southamerica-east1 services-gke-cluster

https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

gcloud config config-helper --format=json

kubectl proxy

obs: Pasting the access token in the field provided will gain you entry to the dashboard.


kubectl get deploy sqlserver-2022-secret -o yaml

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

kubectl exec -it -u root sqlserver-2022-76f9d5f7c6-xw2dn  -- /bin/bash
kubectl exec -ti sqlserver-2022-76f9d5f7c6-xw2dn -- /bin/bash
kubectl exec -ti sqlserver-2022-76f9d5f7c6-xw2dn /bin/bash

kubectl -u root exec -it sqlserver-2022-76f9d5f7c6-xw2dn bash


kubectl ssh -u root -p sqlserver-2022-76f9d5f7c6-xw2dn

kubectl logs repositoriodfe-78fbb74d9b-c42fl  --all-containers

kubectl rollout undo deploy repositoriodfe -n default

gcloud compute scp sc-databases.yaml <your cloud>:/home/<user-name>/data/hostpath-pvc <your zone>

kubectl cp RepositorioDFe-Full-20221009_160000.Bak sqlserver-2022-deployment-5544586d66-tlvrz:/var/opt/mssql


Kubectl create secret generic appsettings-repositoriodfe –from-file="./appsettings.json"
kubectl create secret generic appsettings-repositoriodfe --from-file=./appsettings.json

kubectl delete pod repositoriodfe-78fbb74d9b-c42fl



docker exec -u root -it c80b9f2a81b640bc1960ccf868cb428e7596871783265280aab06af09d717779 /bin/bash
