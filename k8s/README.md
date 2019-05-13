# k8s secret
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf

# apply all configurations from folder
kubectl apply -f k8s