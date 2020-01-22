## Cheat sheet to run useful docker commands on CC13.x deployment cluster 
#### Tested on Redhat 7.6 ES + RHOSP13 + CN 5.x

1. Below are some of the docker useful commands 
```
docker ps
docker ps -l
docker ps -a
docker image ls
docker pull <image_name>
docker exec -it -u root <docker_name> bash
docker exec -it <docker_name> bash
docker ps --filter name=haproxy
docker logs --follow <container_name>
docker volume ls
docker rm <container_name>
docker rmi <image_name>
docker stop $(docker ps -a -q)
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker inspect <container_name>
docker container ls
docker container ls -a
docker container stop <container_name>
docker start -i <last_ran_container>
docker run -it --rm <container_image_name>
docker run -d --rm -p 5080:80 -v $PWD:/usr/share/nginx/html:ro --name nginx1 nginx:latest
docker run --rm -d --name <container_name> nginx:latest
docker stats --no-stream <container_name>
docker port <container_name>
docker run --rm -it -v $PWD:/scripts <container_image_name> python script.py
```

2. Contrail logs
```
/var/log/containers/contrail   << On Host VM
/var/log/contrail/             << Inside docker
```

## Reference
[docker command List](https://docker.com)
