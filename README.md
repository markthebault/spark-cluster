# Spark cluster running on with docker-compose
This repository contains Dockerfiles to build a spark cluster and jupyer working with spark.

## Run the cluster
To launch the spark cluster go in a shell with docker installed and run the command `docker-compose up -d`

## Increase the number of spark worker
The spark workers execute the spark code, you may need to have several to test the parallelizum of the spark code.
To scale up the worker run the command `docker-compose scale worker=n` where n is the number of worker that you want.
