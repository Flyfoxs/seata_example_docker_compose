
### 创建网络

docker network create sc-net


cd ./account-service
mvn package && mvn docker:build

cd ../business-service
mvn package && mvn docker:build


cd ../order-service
mvn package && mvn docker:build

cd ../storage-service
mvn package && mvn docker:build

cd ../docker-compose
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d

