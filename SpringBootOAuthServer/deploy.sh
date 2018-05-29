eval $(docker-machine env devlocal)
gradle clean build
docker network disconnect apiconnectdockermaster_ibmnet  microservice
docker rm -f microservice
docker build . -t microservice
docker run -d --name microservice -p 8080:8080 microservice
docker network connect apiconnectdockermaster_ibmnet  microservice