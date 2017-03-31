#!/bin/bash
mkdir /opt
mkdir /opt/bin
echo "------------------------ now downlaod kube-proxy ------------------------
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-proxy
chmod +x kube-proxy
mv kube-proxy  /opt/bin

echo "------------------------ now downlaod e2e ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/e2e
chmod +x e2e
mv e2e /opt/bin

echo "------------------------ now downlaod kubecfg ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubecfg
chmod +x kubecfg 
mv kubecfg /opt/bin

echo "------------------------ now downlaod kubelet ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubelet
chmod +x kubelet
mv kubelet /opt/bin

echo "------------------------ now downlaod integration ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/integration
chmod +x integration
mv integratio /opt/bin 

echo "------------------------ now downlaod kubectl ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /opt/bin

echo "------------------------ now downlaod kubernetes ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kubernetes
chmod +x kubernetes
mv kubernetes /opt/bin

echo "------------------------ now downlaod kube-scheduler ------------------------"
curl -O  https://storage.googleapis.com/kubernetes-release/release/v1.6.0/bin/linux/amd64/kube-scheduler
chmod +x kube-scheduler
mv kube-scheduler /opt/bin 

echo "----------------------------------- check downfile file !! -----------------------------"
ls -l /opt/bin

read -n 1 -p "Press any key to continue..."

echo "============== copy config file ================="
cp service/scheduler.service /etc/systemd/system/scheduler.service
cp service/proxy.service /etc/systemd/system/proxy.service
cp service/kubelet.service /etc/systemd/system/kubelet.service
echo "=================================================="

systemctl daemon-reload
systemctl start scheduler.service
systemctl enable scheduler.service
systemctl status scheduler.service

systemctl daemon-reload
systemctl start proxy.service
systemctl enable proxy.service
systemctl status proxy.service

systemctl daemon-reload
systemctl start kubelet.service
systemctl enable kubelet.service
systemctl status kubelet.service

mkdir ~/.kube
cp  service/cmd_config ~/.kube/config
