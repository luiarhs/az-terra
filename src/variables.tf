variable "name" {
  type    = string
  default = "aksenvironment01"
}

variable "resource_group_name" {}
variable "location" {}

variable "node_count" {
  type    = string
  default = 3
}

# variable "k8s_version" {
#   type    = string
#   default = "1.28.5"
# }
