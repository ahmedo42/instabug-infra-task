dockerpath=ahmedo42/docker-violin-task


kubectl run docker-violin-task --image=$dockerpath --port=8080 --labels app=docker-violin-task


kubectl get pods


kubectl port-forward docker-violin-task 8080:8080