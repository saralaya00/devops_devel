

: 1681761334:0;python3 -m pip install --user ansible
: 1681761358:0;ansible --version
: 1681761376:0;python3 -m pip show ansible

: 1681762083:0;vagrant plugin install vagrant-vbguest

: 1681803754:0;vagrant up
: 1681803966:0;vagrant provision
: 1681804036:0;vagrant ssh
: 1681804198:0;vagrant destroy


: 1681933618:0;ssh -i ~/.ssh/dftd -p 2222 bender@localhost


: 1681938323:0;sudo nmap -F 192.168.56.14
: 1681938412:0;sudo nmap -sV 192.168.56.14
: 1681939634:0;for i in `seq 1 6` ; do curl -w "\n" http://192.168.56.14:5000 ; done


# docker - Chapter 6
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


#  kubernetes - Chapter 7 commands
$ minikube start   
$ minikube status
$ minikube kubectl cluster-info

$ minikube kubectl -- explain deployment.metadata.labels 
$ minikube kubectl -- explain deployment.spec

$ minikube kubectl -- apply -f kubernetes 
$ minikube kubectl -- get deployment.apps telnet-server
$ minikube kubectl get pods 
$ minikube kubectl -- get pods -l app=telnet-server
$ minikube kubectl -- get services -l app=telnet-server

$ minikube tunnel 
$ minikube kubectl -- get services telnet-server
$ telnet 10.108.200.178 2323 


[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- get pods -l app=telnet-server
NAME                            READY   STATUS    RESTARTS   AGE
telnet-server-b546b8495-c48cw   1/1     Running   0          37m
telnet-server-b546b8495-vlz2d   1/1     Running   0          37m
[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- delete pod telnet-server-b546b8495-c48cw
pod "telnet-server-b546b8495-c48cw" deleted
[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- get pods -l app=telnet-server
NAME                            READY   STATUS    RESTARTS   AGE
telnet-server-b546b8495-tfq8w   1/1     Running   0          14s
telnet-server-b546b8495-vlz2d   1/1     Running   0          37m

[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- scale deployment telnet-server --replicas=3
deployment.apps/telnet-server scaled
[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- get deployments.apps telnet-server
NAME            READY   UP-TO-DATE   AVAILABLE   AGE
telnet-server   3/3     3            3           40m


[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- logs telnet-server-b546b8495-vlz2d
telnet-server: 2023/04/21 19:37:33 telnet-server listening on [::]:2323
telnet-server: 2023/04/21 19:37:33 Metrics endpoint listening on :9000

[~/devel/devops_for_the_desperate/telnet-server]$ minikube kubectl -- logs -l app=telnet-server --all-containers=true --prefix=true
[pod/telnet-server-b546b8495-tfq8w/telnet-server] telnet-server: 2023/04/21 20:15:11 Metrics endpoint listening on :9000
[pod/telnet-server-b546b8495-tfq8w/telnet-server] telnet-server: 2023/04/21 20:15:11 telnet-server listening on [::]:2323
[pod/telnet-server-b546b8495-vcgsk/telnet-server] telnet-server: 2023/04/21 20:17:07 telnet-server listening on [::]:2323
[pod/telnet-server-b546b8495-vcgsk/telnet-server] telnet-server: 2023/04/21 20:17:07 Metrics endpoint listening on :9000
[pod/telnet-server-b546b8495-vlz2d/telnet-server] telnet-server: 2023/04/21 19:37:33 telnet-server listening on [::]:2323
[pod/telnet-server-b546b8495-vlz2d/telnet-server] telnet-server: 2023/04/21 19:37:33 Metrics endpoint listening on :9000

