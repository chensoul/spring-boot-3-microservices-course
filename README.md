# Spring Boot 3 Microservices

This repository contains the latest source code of the spring-boot-microservices tutorial

You can watch the tutorial on Youtube [here](https://youtu.be/yn_stY3HCr8?si=EjrBEUl0P-bzSWRG)

## Modules

- **api-gateway**：This service is an API Gateway to the internal backend services
    - **TechStack**: Spring Boot, Spring Cloud Gateway, Spring Cloud CircuitBreaker, Resilience4J, SpringDoc, Prometheus, Zipkin, Loki
- **inventory-service**：This services provides REST API for managing inventory.
    - **TechStack**: Spring Boot, Spring Data JPA, MySQL, SpringDoc, Prometheus, Zipkin, Loki
- **notification-service**：This services provides REST API for sending notifications.
    - **TechStack**: Spring Boot, Spring Kafka, Avro, Mail, SpringDoc, Prometheus, Zipkin, Loki
- **order-service**：This services provides REST API for managing orders.
    - **TechStack**: Spring Boot, Spring Data JPA, MySQL, Spring Kafka, Avro, Spring Cloud CircuitBreaker, Resilience4J, Spring WebFlux, SpringDoc, Prometheus, Zipkin, Loki
- **product-service**：This services provides REST API for managing products and catalogs.
    - **TechStack**: Spring Boot, Spring Data JPA, Mongodb, SpringDoc, Prometheus, Zipkin, Loki

## Tech Stack
* Building Spring Boot REST APIs
* Creating Aggregated Swagger Documentation at API Gateway
* Database Persistence using Spring Data JPA, MySQL, Mongodb, Flyway
* Distributed Tracing using Zipkin
* Event Driven Async Communication using Spring Kafka and avro
* Implementing API Gateway using Spring Cloud Gateway
* Implementing Resiliency using Resilience4j
* Using WebClient, Declarative HTTP Interfaces to invoke other APIs
* Local Development Setup using Docker, Docker Compose and Testcontainers
* Monitoring & Observability using Grafana, Prometheus, Loki, Tempo
* Testing using JUnit 5, RestAssured, Testcontainers, Awaitility, WireMock
* Deployment to Kubernetes using Kind

## Application Architecture

![image](https://github.com/user-attachments/assets/d4ef38bd-8ae5-4cc7-9ac5-7a8e5ec3c969)

## Local Development Setup
- Install Java 21 and Maven 3. Recommend using [SDKMAN](https://sdkman.io/).
- Install [Docker](https://www.docker.com/). Recommend using [OrbStack](https://orbstack.dev/) for Macos.
- Install [IntelliJ](https://www.jetbrains.com/idea) IDEA or any of your favorite IDE
- Install [Postman](https://www.postman.com/) or any REST Client

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

Run the k8s/kind/create-cluster.sh script to create the kind Kubernetes cluster

```shell
./k8s/kind/create-cluster.sh
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

### Delete Kind Cluster

Run the k8s/kind/create-cluster.sh script to create the kind Kubernetes cluster

```shell
./k8s/kind/delete-cluster.sh
```