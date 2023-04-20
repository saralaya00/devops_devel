$ minikube start --driver=virtualbox 
$ eval $(minikube -p minikube docker-env)

$ docker version
$ docker build -t dftd/telnet-server:v1 .

Successfully built 4044b8db06a6

$ docker image ls dftd/telnet-server:v1

$ docker run -p 2323:2323 -d --name telnet-server dftd/telnet-server:v1
03ff7e751564f1348feb3700840e448481fc0792a565738e4ab1d67f3e0713a1

$ docker container ls -f name=telnet-server
CONTAINER ID   IMAGE                   COMMAND             CREATED         STATUS         PORTS                    NAMES
03ff7e751564   dftd/telnet-server:v1   "./telnet-server"   3 minutes ago   Up 3 minutes   0.0.0.0:2323->2323/tcp   telent-seerver

$ docker exec telnet-server ls
$ docker exec -it telnet-server /bin/sh
$ docker inspect telnet-server

$ docker container stop telnet-server
$ docker container rm telnet-server 


$ docker history dftd/telnet-server:v1
$ docker stats telnet-server

$ minikube ip 
$ telnet 192.168.59.100 2323 

$ docker logs telnet-server
