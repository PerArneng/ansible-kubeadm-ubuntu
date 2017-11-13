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

## Network Plugin
```
$ kubectl apply -f https://docs.projectcalico.org/v2.6/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml
```

## Make the master node run pods
```
kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Deploy a test pod
```
kubectl run helloworld --image=tutum/hello-world --port=80 --replicas=2
```

Expose it:
```
kubectl expose deployment helloworld --type=LoadBalancer

```

List it:
```
kubectl get services
```

Test it:
```
curl http://localhost:31826
```