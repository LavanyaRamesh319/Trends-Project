# Trend Application Deployment using DevOps CI/CD Pipeline

## Project Overview

This project demonstrates a complete DevOps CI/CD pipeline for deploying a production-ready React application using Docker, Terraform, AWS EC2, Amazon EKS, Kubernetes, DockerHub, GitHub, and Jenkins.

The pipeline automatically builds, pushes, and deploys the application whenever changes are pushed to GitHub.

---

# Project Architecture

GitHub Repository

        │
        
        ▼
        
GitHub Webhook
  
        │
  
        ▼
Jenkins Pipeline
        │
        ├──────────────► Docker Build
        │
        ├──────────────► Docker Push (DockerHub)
        │
        ▼
Amazon EKS
        │
        ▼
Kubernetes Deployment
        │
        ▼
LoadBalancer
        │
        ▼
Trend Web Application

---

# Technologies Used

- Git & GitHub
- Docker
- DockerHub
- Terraform
- AWS EC2
- AWS IAM
- AWS VPC
- Amazon EKS
- Kubernetes
- Jenkins
- Nginx
- Linux (Amazon Linux)
- GitHub Webhook

---

# Project Structure

```
Trend/
│
├── dist/
├── Dockerfile
├── .dockerignore
├── .gitignore
├── Jenkinsfile
├── terraform/
│     └── main.tf
│
├── k8s/
│     ├── deployment.yaml
│     └── service.yaml
│
└── README.md
```

---

# Application Deployment

### Repository

Original Repository

https://github.com/Vennilavanguvi/Trend.git

The repository was cloned and deployed on port **3000** using Docker.

<img width="940" height="250" alt="image" src="https://github.com/user-attachments/assets/c5968263-72c4-4630-8ca3-0ee916c19900" />


---

# Docker

### Dockerfile Created

The application was containerized using Nginx.

Docker Image

```
lavanyadevops1/trend-app:latest
```

Docker Commands

```bash
docker build -t lavanyadevops1/trend-app:latest .
```

```bash
docker run -d -p 3000:80 lavanyadevops1/trend-app:latest
```
<img width="859" height="270" alt="image" src="https://github.com/user-attachments/assets/5633b245-922b-4727-9891-4fae13e7dcc2" />


<img width="940" height="193" alt="image" src="https://github.com/user-attachments/assets/331adab4-566a-43e2-9393-d736ba16c44b" />


<img width="940" height="467" alt="image" src="https://github.com/user-attachments/assets/0383161d-d0af-4e11-a590-8481a95a5acd" />


---

# Terraform

Infrastructure was provisioned using Terraform.

Resources Created

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- IAM Role
- EC2 Instance (Jenkins Server)

Terraform Commands

```bash
terraform init
```

```bash
terraform validate
```

```bash
terraform plan
```

```bash
terraform apply
```

<img width="763" height="1165" alt="image" src="https://github.com/user-attachments/assets/2e70f0af-bbcf-49de-b3a6-a3c204b92b01" />


<img width="776" height="1146" alt="image" src="https://github.com/user-attachments/assets/2a8d20ad-a0cc-4732-80a9-066713466d74" />


<img width="809" height="994" alt="image" src="https://github.com/user-attachments/assets/51c8e11b-c96d-482f-8b0b-24f599990c26" />


<img width="940" height="553" alt="image" src="https://github.com/user-attachments/assets/fef6f6cc-c44a-4433-87de-e6620fd8f868" />


<img width="940" height="499" alt="image" src="https://github.com/user-attachments/assets/483aaee5-9ea3-4450-bfab-76e83365f2ec" />


<img width="940" height="515" alt="image" src="https://github.com/user-attachments/assets/e3ed5edf-127c-4fac-8aaa-c0af9a81a3a8" />


<img width="915" height="134" alt="image" src="https://github.com/user-attachments/assets/ac18ca35-b1a3-4d3e-bfe3-75739be75b67" />


<img width="940" height="388" alt="image" src="https://github.com/user-attachments/assets/97c736f3-d1a9-4d83-90f3-63cca87a7b66" />


<img width="940" height="473" alt="image" src="https://github.com/user-attachments/assets/25ccb87a-191a-45ce-810e-119e67e9493c" />

---

# DockerHub

DockerHub Repository

```
lavanyadevops1/trend-app
```

Push Commands

```bash
docker login
```

```bash
docker push lavanyadevops1/trend-app:latest
```

<img width="940" height="436" alt="image" src="https://github.com/user-attachments/assets/82cc8a1b-7613-4fc4-a001-b9cedff9d9a6" />


<img width="940" height="413" alt="image" src="https://github.com/user-attachments/assets/5b88f899-e133-41ab-9abe-b255dd4a4bb4" />


<img width="940" height="163" alt="image" src="https://github.com/user-attachments/assets/7f14ac7b-26bb-421e-98da-8315c7f4dcee" />


<img width="940" height="402" alt="image" src="https://github.com/user-attachments/assets/7217c4ca-ed48-452f-87f1-c7d544967a75" />


<img width="940" height="419" alt="image" src="https://github.com/user-attachments/assets/161f5e1b-8869-49ea-8121-7ab8fdc1f0be" />

---

# Kubernetes (Amazon EKS)

Amazon EKS Cluster was successfully created.

<img width="940" height="482" alt="image" src="https://github.com/user-attachments/assets/245ee647-9a10-48cc-9870-46886913a934" />


<img width="940" height="449" alt="image" src="https://github.com/user-attachments/assets/5ec2260f-7ee0-4109-930a-9eae9daaf067" />


Verification

```bash
kubectl get nodes
```

Output

```
2 Worker Nodes
Status : Ready
```

Deployment

```bash
kubectl apply -f k8s/
```

Verification

```bash
kubectl get deployments
```

```bash
kubectl get pods
```

```bash
kubectl get svc
```

---

# Kubernetes Files

deployment.yaml

- Deployment Name: trend-deployment
- Replicas: 2
- Image: lavanyadevops1/trend-app:latest

<img width="851" height="709" alt="image" src="https://github.com/user-attachments/assets/ce890715-046a-4de6-af23-0d4f2b7c687c" />


service.yaml

- Service Type: LoadBalancer
- Port: 80
- Target Port: 80

<img width="714" height="419" alt="image" src="https://github.com/user-attachments/assets/8c2c4d69-4579-4cd6-96cc-fc05e752516b" />


---

# Version Control

GitHub Repository

https://github.com/LavanyaRamesh319/Trends-Project

Files Added

- Dockerfile
- Jenkinsfile
- Terraform Files
- Kubernetes YAML
- .gitignore
- .dockerignore

Git Commands

```bash
git add .
```

```bash
git commit -m "Project completed"
```

```bash
git push origin main
```

<img width="940" height="670" alt="image" src="https://github.com/user-attachments/assets/40b84a5f-956e-494d-a2cc-c98c0fc330af" />


<img width="940" height="319" alt="image" src="https://github.com/user-attachments/assets/595cbba9-4fa9-4fb3-8e64-48de14c5ce0d" />


<img width="940" height="368" alt="image" src="https://github.com/user-attachments/assets/1836b62c-cdee-4571-aae9-0b2fc7cdcda7" />


<img width="940" height="475" alt="image" src="https://github.com/user-attachments/assets/7b969305-dbd7-4604-9e54-c1bfab814374" />

---

# Jenkins

Installed Plugins

- Git
- Docker
- Docker Pipeline
- Kubernetes
- Pipeline
- GitHub

GitHub Webhook

GitHub repository is integrated with Jenkins using Webhook.

Every push automatically triggers the Jenkins Pipeline.

Webhook URL

```
http://<Jenkins-Public-IP>:8080/github-webhook/
```

<img width="940" height="577" alt="image" src="https://github.com/user-attachments/assets/8019845b-f886-4cbb-8ca8-9cb01c67917a" />


<img width="940" height="333" alt="image" src="https://github.com/user-attachments/assets/23352f32-ff97-4d3c-be14-b98562b5775e" />


---

# Jenkins Pipeline Stages

## Checkout

Clone source code from GitHub.

## Build

Build Docker Image.

## Docker Login

Authenticate with DockerHub.

## Push

Push Docker Image to DockerHub.

## Deploy

Deploy application to Amazon EKS using Kubernetes.


<img width="940" height="739" alt="image" src="https://github.com/user-attachments/assets/38978b00-5088-4982-afcb-a5113f9d371b" />

<img width="940" height="715" alt="image" src="https://github.com/user-attachments/assets/fa2ebd1d-a3ae-4568-aea4-1954546f21d9" />

<img width="940" height="148" alt="image" src="https://github.com/user-attachments/assets/317af57a-d323-4da3-bda4-6f0d5f46bf20" />

<img width="940" height="335" alt="image" src="https://github.com/user-attachments/assets/6ce521fb-d9d4-4d39-88be-9569fa754dac" />

<img width="940" height="106" alt="image" src="https://github.com/user-attachments/assets/a3cd035e-caaa-4001-8d33-c550e7e01a31" />


---

# Jenkinsfile

Pipeline contains the following stages:

- Checkout
- Build Docker Image
- Docker Login
- Push Docker Image
- Deploy to Kubernetes

Pipeline Result

```
SUCCESS
```

---

# CI/CD Workflow

Developer Pushes Code

↓

GitHub Webhook Trigger

↓

Jenkins Pipeline Starts

↓

Checkout Repository

↓

Docker Image Build

↓

DockerHub Push

↓

Deploy to Kubernetes

↓

Application Updated Automatically

---

# Kubernetes LoadBalancer

Load Balancer Name

```
aa2c7189b604d42948a2c6e6e05777
```

DNS Name

```
aa2c7189b604d42948a2c6e6e05777-1304545656.ap-south-2.elb.amazonaws.com
```

Type

```
Classic Load Balancer
```

Application URL

```
http://aa2c7189b604d42948a2c6e6e05777-1304545656.ap-south-2.elb.amazonaws.com
```

---


# Screenshots Included

- Application Running
- Docker Image Build
- DockerHub Repository
- Terraform Apply
- EC2 Instance
- EKS Cluster
- Kubernetes Nodes
- Kubernetes Pods
- Kubernetes Services
- Jenkins Dashboard
- Jenkins Pipeline Success
- GitHub Repository
- GitHub Webhook
- LoadBalancer
- Application Output

---

# Project Outcome

Successfully deployed a production-ready React application using a complete DevOps CI/CD pipeline.

Implemented:

- GitHub Version Control
- Docker Containerization
- DockerHub Image Repository
- Infrastructure as Code using Terraform
- AWS EC2
- Amazon EKS
- Kubernetes Deployment
- Jenkins CI/CD Automation
- GitHub Webhook Integration
- Automatic Kubernetes Deployment

The application is automatically rebuilt, pushed to DockerHub, and deployed to Amazon EKS whenever code is pushed to GitHub.

---

## Author

**Lavanya Ramesh**

GitHub

https://github.com/LavanyaRamesh319

DockerHub

https://hub.docker.com/r/lavanyadevops1/trend-app
