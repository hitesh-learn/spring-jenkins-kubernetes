# Spring Boot project - CI/CD deployment to Kubernetes in AWS

Used kops to create a 3 node cluster ,1 t2-medium master and 2 t2-micro nodes.

#### Command to create

```
kops create cluster --name=yoursite.example.com --state=s3://your-bucket-name --zones=ap-southeast-1a --node-count=2 --node-size=t2.micro --master-size=t2.micro --dns-zone=yoursite.example.com --yes
```

#### Command to delete cluster

```
kops delete cluster --name yoursite.example.com --state=s3://your-bucket-name --yes
```

Steps -

1. Basic Spring boot api application one endpoint /test and actutator.
2. Deployed at 3000
3. Jenkins polls scm and builds the code
4. On Ansible server make a directory to hold jar and playbooks.
   `mkdir /opt/spring`
5. After the Jar is built, jenkins will SSH the jar and the Dockerfile to Ansible server to /opt/spring directory (Jenkins and Ansible could be on same server).

![send-image-to-ansible-server](/images/ssh-to-ansible-server.png)

6. Ansible playbooks create a docker image, tag it push it to Docker Hub. (create-docker-image.yml)

```
ansible-playbook -i /opt/spring/hosts /opt/spring/create-docker-image.yml;
```

7. Another Ansible playbook in the post build hook, deploys the image to kubernetes master.(kubernetes_deployment_playbook.yml)

```
ansible-playbook -i /opt/spring/hosts /opt/spring/deploy-spring-deployment-k8.yml;
```

8. Kubernetes manifests are stored in kubernetes master /root directory. (deployment.yml, and service.yml )- the ansible playbook will run those and create 2 pods and a load balancer.

- Not totally automated as I still had to push kubernetes config to master manually and copy ansible server keys to kubernetes master.
- Also if jenkins and ansible in two different keys, need to setup jenkins to be able to ssh to ansible.
- Probably dive into commercial offerings from here

--------------------------------
# circleci changes

   1. Added circleci to build
   2. Push to dockerhub
   3. Then deploy to AWS EKS using Helm.
   4. Added helm charts for step 3.
   5. TODO - Streamline push to EKS without using kubeconfig
   6. Use AWS ECR instead of Docker Hub,


Use Terraform to create the EKS cluster -

https://github.com/hiteshjoshi1/terraform-manifests/tree/master/aws-k8-eks/learn-terraform-provision-eks-cluster

cd into the directory, then

```
terraform plan
```

```
terraform apply
```
Will create 3 node cluster- 1 master , 2 slaves
and VPC etc, a total of 52 AWS respurces.

Bring the environment down with

```
terraform destroy
```


Helm Installation-

```helm install --dry-run --debug tad-puppy ./demo-chart```

```helm install tad-puppy ./demo-chart```

```helm uninstall tad-puppy```


