terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }
  }
}

provider "null" {}

locals {
  jones = ["indy", "henry", "marian"]
}

resource "null_resource" "jones" {
  for_each = toset(local.jones)
  triggers = {
    name = each.value
  }
}
output "jones" {
  value = null_resource.jones
}
