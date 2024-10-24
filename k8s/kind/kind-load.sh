docker pull mongo:8.0.1
docker pull mysql:9.1
docker pull confluentinc/cp-zookeeper:7.7.1
docker pull confluentinc/cp-kafka:7.7.1
docker pull confluentinc/cp-schema-registry
docker pull provectuslabs/kafka-ui:latest
docker pull prom/prometheus:v2.55.0
docker pull grafana/loki:main
docker pull grafana/tempo
docker pull grafana/grafana:11.3.0
docker pull chensoul/sb3mc-api-gateway:latest
docker pull chensoul/sb3mc-product-service:latest
docker pull chensoul/sb3mc-order-service:latest
docker pull chensoul/sb3mc-inventory-service:latest
docker pull chensoul/sb3mc-notification-service:latest

kind load docker-image -n microservices mongo:8.0.1
kind load docker-image -n microservices mysql:9.1
kind load docker-image -n microservices confluentinc/cp-zookeeper:7.7.1
kind load docker-image -n microservices confluentinc/cp-kafka:7.7.1
kind load docker-image -n microservices confluentinc/cp-schema-registry
kind load docker-image -n microservices provectuslabs/kafka-ui:latest
kind load docker-image -n microservices prom/prometheus:v2.55.0
kind load docker-image -n microservices grafana/loki
kind load docker-image -n microservices grafana/tempo
kind load docker-image -n microservices grafana/grafana:11.3.0
kind load docker-image -n microservices chensoul/sb3mc-api-gateway:latest
kind load docker-image -n microservices chensoul/sb3mc-product-service:latest
kind load docker-image -n microservices chensoul/sb3mc-order-service:latest
kind load docker-image -n microservices chensoul/sb3mc-inventory-service:latest
kind load docker-image -n microservices chensoul/sb3mc-notification-service:latest
