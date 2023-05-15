### Author: Rajat Pachare
# Mongo-cluster setup with Ansible server.
This file is used to configure mongo cluster on aws instances.

## Prerequisite
Install terraform and configure with aws credentials.

Install aws-cli. Launch four ec2-instances.

Install Ansible in one ec2 instance.

Make password less configuration from Ansible server to rest ec2 instances.
## Installation
Copy mongo.yml and mongo_replica.yml to ansible server.

Run below command to install mongo servers in all ansible nodes.
```bash
ansible-playbook mongo.yml
```
Run below command to setup mongo-cluster.
```bash
ansible-playbook mongo_replica.yml
```

