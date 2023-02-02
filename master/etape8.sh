cat <<EOF | sudo tee -a /etc/hosts
100.0.0.10 master.k8s.local master
100.0.0.21 worker01.k8s.local worker01
100.0.0.22 worker01.k8s.local worker02
EOF

