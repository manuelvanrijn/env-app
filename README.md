# env-app

This is a example application I used to see if env variables were passed to the container instance on AWS Fargate using AWS Systems Manager Parameter Store

## build

```
docker build -t manuelvanrijn/env-app .
```

## run

```
docker run -p 4567:4567 -e secret=toeter --rm manuelvanrijn/env-app:latest
# browse to http://localhost:4567
```

## docker image

```
docker pull manuelvanrijn/env-app
```
