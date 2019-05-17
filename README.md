# multi-k8s
Cource for kubernetis: www.udemy.com/docker-and-kubernetes-the-complete-guide

# run ruby and mount present dir
docker run -it -v $(pwd):/app ruby:2.3 sh

#install helm on gke 
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh

#set helm tiller service account
kubectl create serviceaccount --namespace kube-system tiller

kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller

helm init --service-account tiller --upgrade

helm install stable/nginx-ingress --name my-nginx --set rbac.create=true