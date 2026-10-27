# Azure Infrastructure Automation with Terraform

Azure infrastructure provisioned with Terraform using Infrastructure as Code principles.

This project creates a resource group, virtual network, subnet, network security group, storage account, remote Terraform state container, App Service Plan and Linux Web App.

The networking and storage resources run in **North Europe**, while the App Service Plan and Web App run in **Sweden Central** because of regional capacity restrictions.

## Technologies Used

- Terraform
- Microsoft Azure
- Azure Virtual Network
- Azure Network Security Group
- Azure Storage Account
- Azure App Service
- GitHub

## Architecture

```text
Terraform Configuration
   ↓
Azure Resource Group
   ↓
Virtual Network → Subnet → Network Security Group
   ↓
Storage Account → Terraform State Container

Terraform Configuration
   ↓
App Service Plan → Linux Web App
```

The App Service is deployed as a separate Azure resource. In this project, it is not integrated into the virtual network.

## Terraform Resources

- Azure Resource Group
- Virtual Network
- Subnet
- Network Security Group and subnet association
- Storage Account
- Blob container for remote Terraform state
- App Service Plan
- Linux Web App

## Run the Project

Initialize Terraform:

```bash
terraform init
```

Format and validate the configuration:

```bash
terraform fmt
terraform validate
```

Review the planned changes:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Show the created resources:

```bash
terraform output
```

## Terraform Outputs

```text
app_service_plan_name = "asp-devops-tf-swedencentral"
network_security_group_name = "nsg-devops-tf-app"
resource_group_location = "northeurope"
resource_group_name = "rg-devops-terraform-neu"
storage_account_name = "stdevopstfr2q9e5"
subnet_name = "snet-app"
terraform_state_container_name = "tfstate"
virtual_network_name = "vnet-devops-tf-northeurope"
web_app_name = "app-devopstf-r2q9e5"
web_app_url = "[https://app-devopstf-r2q9e5.azurewebsites.net](https://app-devopstf-r2q9e5.azurewebsites.net)"
```

## What I Learned

- How to create Azure resources with Terraform.
- How to store Terraform state remotely in Azure Blob Storage.
- How to configure virtual networking and network security rules.
- How to deploy an Azure App Service Plan and Linux Web App.
- How to handle Azure regional capacity and quota limitations.
- How to review Terraform plans before applying infrastructure changes.

## Author

Bence Uri-Kovács
