📌 Project Overview

This project deploys the Strapi Headless CMS on an AWS EC2 instance using Terraform.
The deployment is fully automated using a user_data.sh script that installs Docker, creates a Docker Compose file, and runs Strapi.

This assignment demonstrates:
Infrastructure as Code (IaC)
Terraform basics
AWS EC2 provisioning
Automating deployment using user_data
Running Strapi using Docker Compose

🗂 Project Structure:
├── main.tf
├── variables.tf
├── output.tf
├── user_data.sh
└── PT_ASSIGNMENT_KEY.pub
main.tf → Creates AWS provider, security group, key pair, and EC2 instance
variables.tf → Stores all variable inputs
output.tf → Prints the Public IP + Strapi URL
user_data.sh → Installs Docker + runs Strapi using docker-compose
PT_ASSIGNMENT_KEY.pub → Public key used for EC2 SSH access

🛠 Technologies Used

Terraform
AWS EC2
Docker & Docker Compose
Strapi Headless CMS
Ubuntu

🚀 How Deployment Works

Terraform creates:
An EC2 instance
A security group allowing:
22 → SSH
1337 → Strapi
An AWS key pair
User data script auto-installs Docker and launches Strapi using docker-compose
Once deployed, Strapi is available at:
http://<PUBLIC_IP>:1337/admin

📦 Prerequisites

Before deploying, ensure you have:
Terraform installed
AWS credentials configured
aws configure
A valid AWS key pair (public key included in repo)

▶️ How to Deploy

1️⃣ Initialize Terraform
terraform init

2️⃣ Validate Files
terraform validate

3️⃣ Apply the Infrastructure
terraform apply -auto-approve

4️⃣ Get the Output
Terraform will print:
public_ip = "X.X.X.X"
strapi_url = "http://X.X.X.X:1337"
Copy the URL and open it in the browser.
