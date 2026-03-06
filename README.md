# Azure 3-Tier Architecture with Terraform


 

This project deploys a 3-tier architecture in Azure using Terraform.

 

### Tiers

- Web Tier: Public-facing virtual machine

- Application Tier: Private virtual machine

- Data Tier: Database in a private subnet

 

### Networking

- One Virtual Network (VNet)

- Three subnets:

  - web-subnet

  - app-subnet

  - db-subnet

 

### Traffic Flow

Internet → Web Tier → Application Tier → Data Tier