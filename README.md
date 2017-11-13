# Ansible Playbook to install Kubernetes on Ubuntu 16.04
Based on: https://kubernetes.io/docs/setup/independent/install-kubeadm/

## prepare client machine
```
sudo apt-get install ansible
```

## prepare remote machine (or local)
```
ssh-copy-id <user>@<host>
ssh <user>@<host>
sudo apt-get install python
```

## remote status check
```
sudo systemctl status kubelet
sudo journalctl -u kubelet
```

## Kubectl work for your non-root user
To make kubectl work for your non-root user, you might want to run these commands (which is also a part of the kubeadm init output):

```
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
``` 

## Make the master node run pods
```
kubectl taint nodes --all node-role.kubernetes.io/master-
```