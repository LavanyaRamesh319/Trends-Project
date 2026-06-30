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

---

# Kubernetes (Amazon EKS)

Amazon EKS Cluster was successfully created.

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

service.yaml

- Service Type: LoadBalancer
- Port: 80
- Target Port: 80

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

# Monitoring

Monitoring is an optional requirement.

Prometheus and Grafana can be integrated with Amazon EKS using Helm for monitoring cluster health, CPU, memory usage, pods, deployments, and services.

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
