docker build -t skswami91/multi-client:latest -t skswami91/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t skswami91/multi-server:latest -t skswami91/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t skswami91/multi-worker:latest -t skswami91/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push skswami91/multi-client:latest
docker push skswami91/multi-server:latest
docker push skswami91/multi-worker:latest

docker push skswami91/multi-client:$SHA
docker push skswami91/multi-server:$SHA
docker push skswami91/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=skswami91/multi-server:$SHA
kubectl set image deployments/client-deployment client=skswami91/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=skswami91/multi-worker:$SHA

