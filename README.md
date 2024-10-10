# Spring Boot 3 Microservices

This repository contains the latest source code of the spring-boot-microservices tutorial

You can watch the tutorial on Youtube [here](https://youtu.be/yn_stY3HCr8?si=EjrBEUl0P-bzSWRG)

## Services Overview

- Product Service
- Order Service
- Inventory Service
- Notification Service
- API Gateway using Spring Cloud Gateway MVC

## Tech Stack

The technologies used in this project are:

- Spring Boot
- Mongo DB
- MySQL
- Kafka
- Test Containers with Wiremock
- Grafana Stack (Prometheus, Grafana, Loki and Tempo)
- API Gateway using Spring Cloud Gateway MVC
- Kubernetes

## Application Architecture

![image](https://github.com/user-attachments/assets/d4ef38bd-8ae5-4cc7-9ac5-7a8e5ec3c969)

## How to build the backend services

Run the following command to build and package the backend services into a docker container

```shell
mvn spring-boot:build-image -DskipTests
```

If you want to push the docker images to your docker hub account, you can use the following command.

```shell
mvn spring-boot:build-image -DskipTests \
  -Ddocker.publishRegistry.username=user \
  -Ddocker.publishRegistry.password=secret \
  -Dspring-boot.build-image.publish=true 
```

The above command will build and package the services into a docker container and push it to your docker hub account.

## How to run the services

Make sure you have the following installed on your machine:

- Java 21
- Docker
- Kind Cluster - https://kind.sigs.k8s.io/docs/user/quick-start/#installation

### Start Kind Cluster

Run the k8s/kind/create-kind-cluster.sh script to create the kind Kubernetes cluster

```shell
./k8s/kind/create-kind-cluster.sh
```

This will create a kind cluster and pre-load all the required docker images into the cluster, this will save you time
downloading the images when you deploy the application.

### Deploy the infrastructure

Run the k8s/manisfests/infrastructure.yaml file to deploy the infrastructure

```shell
kubectl apply -f k8s/manifests/infrastructure
```

### Deploy the services

Run the k8s/manifests/applications.yaml file to deploy the services

```shell
kubectl apply -f k8s/manifests/applications
```

### Access the API Gateway

To access the API Gateway, you need to port-forward the gateway service to your local machine

```shell
kubectl port-forward svc/api-gateway 9000:9000
```

### Access the Grafana Dashboards

To access the Grafana dashboards, you need to port-forward the grafana service to your local machine

```shell
kubectl port-forward svc/grafana 3000:3000
```
