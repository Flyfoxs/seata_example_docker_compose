
### 创建网络

docker network create sc-net || true

### 把代码打包到容器

cd ./account-service
mvn package && mvn docker:build

cd ../business-service
mvn package && mvn docker:build


cd ../order-service
mvn package && mvn docker:build

cd ../storage-service
mvn package && mvn docker:build

### 启动所有相关容器
cd ../docker-compose
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d

