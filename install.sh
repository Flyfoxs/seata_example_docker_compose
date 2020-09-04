
### 创建网络

docker network create sc-net || true

### 把代码打包到容器

cd ./account-service
rm -rf target
mvn package && mvn docker:build

cd ../business-service
rm -rf target
mvn package && mvn docker:build


cd ../order-service
rm -rf target
mvn package && mvn docker:build

cd ../storage-service
rm -rf target
mvn package && mvn docker:build

### 启动所有相关容器
cd ../docker-compose
docker-compose down   
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down
docker-compose up -d  
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d
