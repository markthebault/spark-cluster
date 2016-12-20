# Spark cluster running on with docker-compose
This repository contains Dockerfiles to build a spark cluster and jupyer working with spark.

## Run the cluster
To launch the spark cluster go in a shell with docker installed and run the command `docker-compose up -d`

## Increase the number of spark worker
The spark workers execute the spark code, you may need to have several to test the parallelizum of the spark code.
To scale up the worker run the command `docker-compose scale worker=n` where n is the number of worker that you want.

## Build your own spark images
You can find a Dockerfile on either directories, notebook and sparkDocker.
To build the images, just run the command `docker build -t myImage:version .` on each repertory.

You can also use the Makefile to build the images. `make`
Inside the Makefile, you can setup the vesions of spark, hadoop and the packahe of apache toree.
*Note:The tag of the image will be spark:vesion and jupyter-spark:version*
