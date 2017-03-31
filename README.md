# CoreOS-Kubelet-Script

Script to auto install Kubelet in CoreOS (4.9.9)

you must change ip address in 
```
apiserver.service:--insecure-bind-address=192.168.0.69 \
apiserver.service:--etcd_servers=http://192.168.0.69:2379,http://192.168.0.70:2369,http://192.168.0.71:2369 \
apiserver.service:ExecStartPost=-/bin/bash -c "until /usr/bin/curl http://192.168.0.69:8080; do echo \"waiting for API server to come online...\"; sleep 3; done"
cmd_config:    server: http://192.168.0.69:8080
controller-manager.service:--master=http://192.168.0.69:8080 \
kubelet.service: --api-servers=http://192.168.0.69:8080 \
proxy.service:ExecStart=/opt/bin/kube-proxy --master=http://192.168.0.69:8080 --logtostderr=true
scheduler.service:ExecStart=/opt/bin/kube-scheduler --master=192.168.0.69:8080

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
