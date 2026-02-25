# 🚀 AWS Blue/Green Deployment for Strapi using ECS, CodeDeploy & GitHub Actions

This project demonstrates a **production-grade Blue/Green deployment architecture** for a Strapi application using:

- AWS ECS (Fargate)
- Application Load Balancer (ALB)
- Amazon RDS (PostgreSQL)
- AWS CodeDeploy (ECS Blue/Green)
- Terraform (Infrastructure as Code)
- GitHub Actions (CI/CD automation)

---

## 🏗 Architecture Overview

This project provisions:

- VPC with public & private subnets
- Internet Gateway & routing
- Security Groups
- Amazon RDS PostgreSQL
- ECS Cluster (Fargate)
- Application Load Balancer
- Two Target Groups (Blue & Green)
- CodeDeploy Application & Deployment Group
- Canary traffic shifting (10% for 5 minutes)

### 🔵 Blue/Green Deployment Flow

1. New ECS task revision is created
2. Replacement task set (Green) is launched
3. Health checks are validated
4. 10% traffic is shifted
5. Wait 5 minutes (canary window)
6. 100% traffic shifted to Green
7. Original (Blue) task set terminated

This ensures **zero downtime deployment**.

---
## 🚀 CI/CD Workflows

### 1️⃣ Create Infrastructure

Manually triggered workflow.

Creates full infrastructure using Terraform:

- VPC
- RDS
- ALB
- ECS
- CodeDeploy
---

### 2️⃣ Blue/Green Deployment

Triggers CodeDeploy ECS Blue/Green deployment.

- Launches new task set
- Shifts traffic using canary strategy
- Terminates old tasks
---

### 3️⃣ Destroy Infrastructure

Destroys all AWS resources created by Terraform.
---

## 🌐 Accessing the Application

After infrastructure is created:

1. Go to AWS Console
2. EC2 → Load Balancers
3. Copy the ALB DNS name

Open in browser

---
## 🛠 Deployment Strategy

Deployment configuration used:


This means:

- 10% traffic shifted initially
- 5 minute monitoring window
- 100% traffic shift after success
- Automatic rollback on failure

---

## 📊 Health Checks Configuration

Target Groups use:

- Path: `/admin`
- Success Codes: `200-399`
- Port: `1337`

This ensures proper health validation for Strapi.

---

## 💡 Key Concepts Demonstrated

- Infrastructure as Code (Terraform)
- Remote State Backend (S3)
- ECS Fargate Service
- ALB Target Groups (Blue/Green)
- Canary Deployment Strategy
- Zero Downtime Deployment
- Automated CI/CD via GitHub Actions
- Automated Rollback Support

---

## 🧠 Production Considerations

For production environments, consider:

- Adding HTTPS (ACM + ALB Listener 443)
- Enabling RDS encryption
- Enabling CloudWatch alarms for rollback
- Using Secrets Manager for DB credentials
- Adding environment-based deployments (staging/prod)
- Adding GitHub approval gates

---
---

## 🏆 Outcome

This project demonstrates a complete end-to-end DevOps pipeline:

✔ Infrastructure provisioning  
✔ Container orchestration  
✔ Blue/Green deployment  
✔ Canary traffic shifting  
✔ Zero downtime releases  
✔ CI/CD automation  
✔ Safe rollback capability  

---

