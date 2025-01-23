terraform {
  required_version = "= 1.9.8"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.83.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "= 2.33.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.16.1"
    }
  }
}
