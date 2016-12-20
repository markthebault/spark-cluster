FROM java:8


ENV APACHE_SPARK_VERSION 1.6.1
ENV APACHE_HADOOP_VERSION 2.6


RUN cd /tmp && \
        wget -q http://d3kbcqa49mib13.cloudfront.net/spark-${APACHE_SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION}.tgz && \
        tar xzf spark-${APACHE_SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION}.tgz -C /usr/local && \
        rm spark-${APACHE_SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION}.tgz

RUN cd /usr/local && ln -s spark-${APACHE_SPARK_VERSION}-bin-hadoop${APACHE_HADOOP_VERSION} spark
