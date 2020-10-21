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

cd ../



cd ./docker-compose
# 关闭相关服务, 准备重启
docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down

# 启动基础服务
# docker-compose -f docker-compose.yml up -d

## DB 初始化
#docker-compose up mysql-init

date
COMPOSE_HTTP_TIMEOUT=200 docker-compose -f docker-compose.yml  up -d

flag=1
while [ $flag -ne 0 ]; do
  sleep 3
  curl -X POST "http://127.0.0.1:8848/nacos/v1/cs/configs?dataId=example-dev.yaml&group=DEFAULT_GROUP&type=yaml&content=mockException%3A%20false%0Axx%3A%20false"
  flag=$?
done

date

#启动业务服务
COMPOSE_HTTP_TIMEOUT=200 docker-compose -f docker-compose.seata.sample.yml up -d
date
