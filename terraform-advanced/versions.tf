terraform {
  required_version = ">= 1.3.0"
  required_providers {
    random = {
      source = "hashicorp/random"
    }
    null = {
      source = "hashicorp/null"
    }
    local = {
      source = "hashicorp/local"
    }
    time = {
      source = "hashicorp/time"
    }
  }
}

provider "random" {}
provider "null" {}
provider "local" {}
provider "time" {}

