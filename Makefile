SPARK_VERSION=1.6.1
HADOOP_VERSION=2.6
TOREE_PACKAGE_SPARK_16=https://dist.apache.org/repos/dist/dev/incubator/toree/0.1.0/rc6/toree-pip/apache-toree-0.1.0.tar.gz
TOREE_PACKAGE_SPARK_2=https://dist.apache.org/repos/dist/dev/incubator/toree/0.2.0/snapshots/dev1/toree-pip/toree-0.2.0.dev1.tar.gz

all: build

build: build-spark build-jupyter create-docker-compose



build-spark:
	mkdir -p .tmp
	cp sparkDocker/Dockerfile.template .tmp/Dockerfile
	#Change spark verson in the Dockerfile
	sed -i=saved "s/%%SPARK_VERSION%%/$(SPARK_VERSION)/g" .tmp/Dockerfile
	sed -i=saved "s/%%HADOOP_VERSION%%/$(HADOOP_VERSION)/g" .tmp/Dockerfile
	cd .tmp && docker build -t spark:${SPARK_VERSION} .
	rm -Rf .tmp




build-jupyter:
	cp -r notebook .tmp
	rm .tmp/Dockerfile
	mv .tmp/Dockerfile.template .tmp/Dockerfile
	#Change spark verson in the Dockerfile
	sed -i=saved "s/%%SPARK_VERSION%%/$(SPARK_VERSION)/g" .tmp/Dockerfile
	sed -i=saved "s/%%HADOOP_VERSION%%/$(HADOOP_VERSION)/g" .tmp/Dockerfile
	sed -i=saved "s#%%TOREE_PACKAGE%%#$(TOREE_PACKAGE_SPARK_16)#g" .tmp/Dockerfile
	cd .tmp && docker build -t jupyter-spark:${SPARK_VERSION} .
	rm -Rf .tmp

create-docker-compose:
	cp docker-compose.yml.template docker-compose-builded.yml
	sed -i=saved "s/__SPARK_IMAGE_NAME__/spark:$(SPARK_VERSION)/g" docker-compose-builded.yml
	sed -i=saved "s/__JUPYTER_IMAGE_NAME__/jupyter-spark:$(SPARK_VERSION)/g" docker-compose-builded.yml
