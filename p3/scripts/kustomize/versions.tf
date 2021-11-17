terraform {
  required_providers {
    kustomization = {
      source  = "kbst/kustomize"
      version = "0.2.0-beta.3"
    }
    random = {
      source  = "hashicorp/random"
      version = "2.2.1"
    }
  }
  required_version = ">= 0.13"
}
