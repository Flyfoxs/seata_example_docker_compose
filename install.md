### abc

### 创建网络

docker network create sc-net



把各个Service封装到Docker



添加docker插件



IP替换为 docker容器名, 并把容器加入网络





### 所有的docker文件绑定到对应网络



docker-compose -f docker-compose.yml up -d

docker-compose up mysql-init



docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d account-service



mvn package && mvn docker:build

docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down  

docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d  

cd ./gateway/gateway-web
mvn package && mvn docker:build



docker logs -f business-service





docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml down
 docker-compose -f docker-compose.yml -f docker-compose.seata.sample.yml up -d





#



http://localhost:18082/storage/C00321/2



http://127.0.0.1:18081/seata/feign

http://127.0.0.1:18081/seata/rest





