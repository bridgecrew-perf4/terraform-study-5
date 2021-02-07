provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
}

terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket  = "aws-teste-terra"
    key     = "terraform-study.tfstate"
    encrypt = true
    region  = "us-east-1"
  }
}