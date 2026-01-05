provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "meu-terraform-states-soat-948512815388"
    key            = "env:/dev/dynamo/pagamento/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-soat"
  }
}