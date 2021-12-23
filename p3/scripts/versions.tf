terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
  required_version = ">= 0.13"
}
