#!/bin/bash
here=`pwd`
mkdir /opt
mkdir /opt/bin
echo "------------------------ now downlaod kube-apiserver ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-apiserver
echo "------------------------ now downlaod kube-controller-manager ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-controller-manager
chmod +x kube-apiserver
chmod +x kube-controller-manager
mv kube-apiserver /opt/bin
mv kube-controller-manager /opt/bin

echo "----------------------------------- check downfile file !! -----------------------------"
ls -l /opt/bin

read -n 1 -p "Press any key to continue..."

echo "============== copy config file ================="
cd $here
cp service/apiserver.service /etc/systemd/system/apiserver.service
cp service/controller-manager.service /etc/systemd/system/controller-manager.service
echo "=================================================="

systemctl daemon-reload
systemctl start apiserver.service
systemctl enable apiserver.service 
systemctl status apiserver.service
netstat -natp |grep 8080 |grep 0.0.0.0
read -n 1 -p "Press any key to continue..."

systemctl daemon-reload
systemctl start controller-manager.service
systemctl enable controller-manager.service
systemctl status controller-manager.service
read -n 1 -p "Press any key to continue..."
