# 使用官方 MySQL 镜像作为基础镜像
FROM mysql:latest

# 设置环境变量
ENV MYSQL_ROOT_PASSWORD=123456
ENV MYSQL_DATABASE=test

# 将 MySQL 数据目录挂载到宿主机，实现数据持久化
VOLUME /var/lib/mysql

# 复制自定义的配置文件到容器中
COPY conf/my.cnf /etc/mysql/my.cnf