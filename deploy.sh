docker build -t wemaptech/multi-client:latest -t wemaptech/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t wemaptech/multi-server:latest -t wemaptech/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t wemaptech/multi-worker:latest -t wemaptech/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push wemaptech/multi-client:latest
docker push wemaptech/multi-server:latest
docker push wemaptech/multi-worker:latest

docker push wemaptech/multi-client:$SHA
docker push wemaptech/multi-server:$SHA
docker push wemaptech/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=wematech/multi-server:$SHA
kubectl set image deployments/client-deployment client=wematech/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=wematech/multi-worker:$SHA