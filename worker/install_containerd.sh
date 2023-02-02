# Configure persistent loading of modules
sudo tee /etc/modules-load.d/containerd.conf <<EOF
overlay
br_netfilter
EOF
# Load at runtime
sudo modprobe overlay
sudo modprobe br_netfilter
# Ensure sysctl params are set
sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF
# Reload configs
sudo sysctl --system
# Install required packages
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
# Add Docker repo
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# Install containerd
sudo yum install -y containerd.io
# Configure containerd and start service
sudo mkdir -p /etc/containerd
sudo containerd config default | sudo tee /etc/containerd/config.toml
# restart containerd
sudo systemctl restart containerd
sudo systemctl enable containerd
