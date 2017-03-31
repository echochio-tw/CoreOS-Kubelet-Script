#!/bin/bash
here=`pwd`
mkdir /opt/bin
cd /opt/bin
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-apiserver
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-controller-manager

chmod +x *

echo "check downfile file !!"
ls -l

pause 
echo "============== copy config file ================="
cd $here
cp service/apiserver.service /etc/systemd/system/apiserver.service
cp service/controller-manager.service /etc/systemd/system/controller-manager.service
echo "=================================================="

systemctl daemon-reload
systemctl start apiserver.service
systemctl enable apiserver.service 
sleep 20
systemctl status apiserver.service
netstat -natp |grep 8080
pause

systemctl daemon-reload
systemctl start controller-manager.service
systemctl enable controller-manager.service
netstat -natp |grep kube-controlle
pause 
