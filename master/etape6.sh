lsmod | grep br_netfilter

sudo systemctl enable kubelet
sudo kubeadm config images pull


echo "100.0.0.10 master.k8s.local master
100.0.0.21 worker01.k8s.local worker01
100.0.0.22 worker02.k8s.local worker02" | sudo tee -a /etc/hosts

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --upload-certs --control-plane-endpoint=master.k8s.local --apiserver-advertise-address=100.0.0.10
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

