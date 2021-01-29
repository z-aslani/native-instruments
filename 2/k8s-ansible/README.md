K8s cluster
=========

this is a playbook for deploying a single master K8s cluster

Requirements
------------

this playbook by default installs(if neccessery) and configure the firewall so that only nodes can communicate to one another(you can disable it by setting the 'allow_firewall_config' to false)

this playbook works base on ssh protocol so enabled ssh communication is required

so if the ssh is set on diffrent port and you dont have any firewall installed on your servers and you wish the play book to configure it for you, please install the firewall yourself and add your ssh port to the firewall

Playbook Variables
--------------

there are some key variable set that needs to be set in this playe book

1) k8s-hosts.txt which contains the informations about Master and worker nodes, Load balancers, and the joining nodes

2) roles/prerequisites/vars/main.yml which contains essential data for things that needs to be done before we start deploying the cluster

Dependencies
------------

no special dependencies is required for this playbook

note that this playbook only deploys the cluster on Debian and RHEL based systems

How To Use
----------------

just simply run the command below on an ansible-system
```
ansible-playbook -i k8s-hosts.txt k8s.yml --extra-vars='{"apply_prerequisites":"true" ,  "allow_install":"true" , "allow_config":"true" , "allow_run":"true"}'

(Note that you have to complete the k8s-hosts.txt file and roles/prerequisites/vars/main.yml file.)

```
where each variable passad by --extra-vars disables a role if not set to true

Author Information
------------------

e-mail: z.aslani@ieee.org

