# terraform/modules/sql_database/main.tf

variable "resource_group_name" {
  description = "Name of the resource group where SQL Database will be deployed."
}

variable "location" {
  description = "Azure region where the SQL Database will be deployed."
}

variable "database_name" {
  description = "Name of the SQL Database."
}

variable "server_name" {
  description = "Name of the SQL Server."
}

variable "administrator_login" {
  description = "Administrator login for the SQL Server."
}

variable "administrator_password" {
  description = "Administrator password for the SQL Server."
}

provider "azurerm" {
  features {}
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0" # Choose the desired version

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password

  tags = {
    Environment = "Production"
  }
}

resource "azurerm_mssql_database" "database" {
  name                = var.database_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
  server_id             = azurerm_mssql_server.sql_server.id
#   server_name         = azurerm_sql_server.sql_server.name
#   edition             = "Basic" # Choose the desired edition
  collation             = "SQL_Latin1_General_CP1_CI_AS"
  license_type          = "LicenseIncluded"
  max_size_gb           = 4

  tags = {
    Environment = "Production"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}