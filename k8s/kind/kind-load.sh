docker pull mongo
docker pull mysql:8
docker pull confluentinc/cp-zookeeper
docker pull confluentinc/cp-kafka
docker pull confluentinc/cp-schema-registry
docker pull provectuslabs/kafka-ui:latest
docker pull prom/prometheus
docker pull grafana/loki:main
docker pull grafana/tempo
docker pull grafana/grafana
docker pull chensoul/new-api-gateway:latest
docker pull chensoul/new-product-service:latest
docker pull chensoul/new-order-service:latest
docker pull chensoul/new-inventory-service:latest
docker pull chensoul/new-notification-service:latest

kind load docker-image -n microservices mongo
kind load docker-image -n microservices mysql:8
kind load docker-image -n microservices confluentinc/cp-zookeeper
kind load docker-image -n microservices confluentinc/cp-kafka
kind load docker-image -n microservices confluentinc/cp-schema-registry
kind load docker-image -n microservices provectuslabs/kafka-ui:latest
kind load docker-image -n microservices prom/prometheus
kind load docker-image -n microservices grafana/loki:main
kind load docker-image -n microservices grafana/tempo
kind load docker-image -n microservices grafana/grafana
kind load docker-image -n microservices chensoul/new-api-gateway:latest
kind load docker-image -n microservices chensoul/new-product-service:latest
kind load docker-image -n microservices chensoul/new-order-service:latest
kind load docker-image -n microservices chensoul/new-inventory-service:latest
kind load docker-image -n microservices chensoul/new-notification-service:latest
