SPARK_VERSION=1.6.1
HADOOP_VERSION=2.6

build: build-spark build-jupyter

build-spark:
	cd sparkDocker && docker build -t spark:${SPARK_VERSION} .

build-jupyter:
	cd notebook && docker build -t notebook:${SPARK_VERSION} .
