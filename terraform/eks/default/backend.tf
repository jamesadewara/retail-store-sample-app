terraform {
  backend "s3" {
    bucket = "project-bedrock-tfstate-altsoe0253359"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}