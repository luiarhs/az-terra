# terraform/main.tf

# Define any global resources that are shared across all environments
// For example, you might define a storage account, virtual network, etc.

# Include configurations for dev environment
module "dev" {
  source = "./environments/dev"
}

# Include configurations for prod environment
# module "prod_environment" {
#   source = "./environments/prod"
# }

# Other global configurations and resources can go here
