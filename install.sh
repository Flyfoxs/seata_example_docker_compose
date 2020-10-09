cd "$(dirname "$0")"

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




cd ../docker-compose
# 关闭相关服务, 准备重启
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down

# 启动基础服务
docker-compose -f docker-compose.yml up -d

## DB 初始化
#docker-compose up mysql-init

#启动业务服务
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d

