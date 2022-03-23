# Impala on S3 with Docker

## Install docker for your OS

https://docs.docker.com/engine/installation/

## Install docker-compose

```bash
pip3 install docker-compose
```

Create an alias for docker-compose command
```
alias dc=docker-compose
```

## Build the image
```bash
dc build
dc create
docker network create impala-docker_default
```

## Create the .env file
```
AWS_SECRET_ACCESS_KEY=your_secret
AWS_ACCESS_KEY_ID=your_key
S3_DEFAULT_BUCKET=your_bucket
```

## Start Impala

```bash
dc start
```

## Test impala on s3

```bash
dc exec worker impala-shell 
```
If you see that your are not connected, do CTRL-D and retry a bit later.
To make sure all the processes are up, you shoud do : 

```bash
dc ps
```
(It's normal that impala-base is not up)

###SQL
```sql
CREATE DATABASE  s3test LOCATION 's3a://your_bucket/impala-db-in-docker';
CREATE EXTERNAL TABLE s3test.smallParquet ( a INT, b STRING) STORED AS PARQUET LOCATION  's3a://your_bucket/impala-db-in-docker/smallParquet';
INSERT INTO s3test.smallParquet VALUES (1,'2');
SELECT * from s3test.smallParquet; 
```

Validate that the data is there :
```
dc exec worker aws s3 ls s3://your_bucket/impala-db-in-docker/smallParquet/
```

