# Scalable & Highly Available Web Application on AWS

## 📌 Project Overview
This project demonstrates the architecture and deployment of a highly available and auto-scaling web application hosted on AWS. It utilizes an **Application Load Balancer (ALB)** to distribute incoming web traffic across multiple **Amazon EC2** instances managed by an **Auto Scaling Group (ASG)**.

---

## 🏗️ Architecture & Key Components
* **Amazon VPC:** Default VPC with subnets spanning across multiple Availability Zones (AZs) for High Availability.
* **EC2 Launch Template:** Defines server configurations and automated boot script (User Data).
* **Application Load Balancer (ALB):** Single point of entry distributing HTTP port 80 traffic across healthy EC2 targets.
* **Auto Scaling Group (ASG):** Automatically adjusts instance capacity (Min: 2, Desired: 2, Max: 4) based on CPU utilization metrics.
* **Security Group:** Restricts inbound access to HTTP (Port 80) traffic.

---

## 🚀 Deployment Steps

1. **Security Group Setup:**
   * Created `web-server-sg` allowing inbound HTTP (port 80) traffic from anywhere (`0.0.0.0/0`).

2. **Launch Template Configuration:**
   * Created `web-app-template` using **Amazon Linux 2023 AMI** and `t2.micro` / `t3.micro` instance type.
   * Added `user-data.sh` script to automate Apache web server installation on launch.

3. **Target Group & Load Balancer Setup:**
   * Configured an HTTP Target Group (`web-app-tg`) on Port 80 with health checks enabled.
   * Provisioned an Internet-Facing **Application Load Balancer (ALB)** attached to subnets across 2+ Availability Zones.

4. **Auto Scaling Group Setup:**
   * Created ASG (`web-app-asg`) linked to the Launch Template and Target Group.
   * Defined scaling capacities and set a **Target Tracking Scaling Policy** based on 50% CPU utilization.

---

## ✅ Verification & Results
* Accessing the Load Balancer DNS URL renders the custom webpage successfully.
* Refreshing the page demonstrates traffic routing across different EC2 instances via hostname verification.
* Validated dynamic scale-out behavior under increased traffic conditions.
