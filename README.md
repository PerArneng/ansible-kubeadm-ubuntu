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

## remote status check of kublet
```
sudo systemctl status kubelet
sudo journalctl -u kubelet
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