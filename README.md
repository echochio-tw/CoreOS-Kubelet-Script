# CoreOS-Kubelet-Script

A script to auto install Kubelet in CoreOS (4.9.9)

you must change ip address in 

service/apiserver.service
service/cmd_config
service/controller-manager.service
service/kubelet.service
service/proxy.service
service/scheduler.service


# ./install_server.sh 
It's will install kube-apiserver & kube-controller-manager (file will in /opt/bin)

# ./install_node.sh
It's will install scheduler.service &  proxy.service & kubelet.service  (file will in /opt/bin)


you can check check by 

/opt/bin/kubectl get node
NAME      STATUS    AGE       VERSION
coreos1   Ready     14m       v1.6.0

