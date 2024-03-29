Setup Components
=========
These are the components of a highly available setup:

1. HA Proxy:
Considering two HA Proxy nodes as load balancers to get the customer requests and pass them to the K8s web servers. ( In this case, we can use nginx and also ingress nginx as web servers.)

2. K8s Cluster (I've prepared the ansible K8s cluster playbook for deploying a songle master K8s cluster).
In K8s environement:

 2.1. Web server:
 Using two nginx nodes (nginx service & deployment). Also we can use ingress (like ingress nginx) as k8s web server (ingress controller & resource) to sent the requests to the desired app service.
 I've also configured an auto deploy for nginx (Gitlab ci)
 2.2. Application service 

3. Database:
Considering our requirements we might need different kinds of DBs (SQL, noSQL)
As an example, I've prepared the cluster of MongoDB. (Master, slave and even we can configure a arbiter node as well)

4. Backup storage:
In order to save the backup of DB, K8s manifests and etcd, etc.

5. Monitoring:
For monitoring, I've considered prometheus, grafana and alert manager.

These are the minimum tools we need to consider to setup a highly available environment.
We can even use ELK (Elastic, Logstash, Kibana) in order to aggregate and analyze the nginx logs.



Author Information
------------------

e-mail: z.aslani@ieee.org

