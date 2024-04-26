# Az Terra

### Install Dependencies
Terraform and Helm that we will be using to deploy.

- Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli
- Helm: https://helm.sh/docs/intro/install/
- Azure Cli: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
- Docker Desktop: https://www.docker.com/products/docker-desktop

### Create the resources in Azure use the following commands:

```sh
# Login To Azure
az login

# Create Resource Group
az group create --location southcentralus --name name-rg

# Create Storage Account
az storage account create --name ballastlaneprod --location southcentralus --sku Standard_LRS

# Create Storage Container
az storage container create -n tfstate --account-name ballastlaneprod

# Initialize Terraform
terraform init

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply
```

### Project Structure

terraform/
│
├── modules/
│   ├── aks/
│   └── database/
├── environments/
│   ├── dev/
│   └── prod/
└── main.tf
│
├── README.md
│
└── .gitignore
