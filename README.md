# CoreOS-Kubelet-Script

Script to auto install Kubelet in CoreOS (4.9.9)
```
 git clone https://github.com/chio-nzgft/CoreOS-Kubelet-Script
 cd CoreOS-Kubelet-Script
```

you must change ip address in 
if you want change to 192.168.0.111

and etcd_servers 192.168.0.111, 192.168.0.112 , 192.168.0.113

```
# sed -i 's/192.168.0.69/192.168.0.111/g' service/*
# sed -i 's/192.168.0.70/192.168.0.112/g' service/apiserver.service
# sed -i 's/192.168.0.71/192.168.0.113/g' service/apiserver.service

```
you can check it

```
# grep 192.168.0.111 service/*
service/apiserver.service:--insecure-bind-address=192.168.0.111 \
service/apiserver.service:--etcd_servers=http://192.168.0.111:2379,http://192.168.0.70:2369,http://192.168.0.71:2369 \
service/apiserver.service:ExecStartPost=-/bin/bash -c "until /usr/bin/curl http://192.168.0.111:8080; do echo \"waiting for API server to come online...\"; sleep 3; done"
service/cmd_config:    server: http://192.168.0.111:8080
service/controller-manager.service:--master=http://192.168.0.111:8080 \
service/kubelet.service: --api-servers=http://192.168.0.111:8080 \
service/proxy.service:ExecStart=/opt/bin/kube-proxy --master=http://192.168.0.111:8080 --logtostderr=true
service/scheduler.service:ExecStart=/opt/bin/kube-scheduler --master=192.168.0.111:8080

```

# ./install_server.sh 
It's will install kube-apiserver & kube-controller-manager (file will in /opt/bin)

# ./install_node.sh
It's will install scheduler.service &  proxy.service & kubelet.service  (file will in /opt/bin)


# you can check check by 
```
/opt/bin/kubectl get node
NAME      STATUS    AGE       VERSION
coreos1   Ready     14m       v1.6.0

```
