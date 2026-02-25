terraform {
  backend "s3" {
    bucket  = "gaurav-task10"
    key     = "terraform/state.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}