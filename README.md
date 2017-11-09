# Ansible Playbook to install Kubernetes on Ubuntu 16.04

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