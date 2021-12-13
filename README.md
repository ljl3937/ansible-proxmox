# Ansible for Proxmox

## Pre-requirrement
- Install sshpass

``` apt install sshpass ```

- Install Python3, Python3-pip

``` apt install python3 python3-pip ```

- Install Proxmoxer on proxmox machine and ansible machine.

``` pip3 install proxmoxer ```

## Hosts
- Set the proxmox host name in /etc/hosts.

```10.12.1.105 to-colo-pve05```

- Modify the hosts file in the project directory

```conf
[proxmox]
10.12.1.105 ansible_user=root
[ubuntu]
10.12.1.154 ansible_user=root ansible_password=password
10.12.1.155 ansible_user=root ansible_password=password
[central]
10.12.1.157
```

## Start the entrance
`python3 pvectl`

## Start Ansible (No configuration file will be written, no IP will be set for A10)

`$ ansible-playbook -i hosts main.yml`
