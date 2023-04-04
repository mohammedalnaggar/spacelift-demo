provider "aws" {
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "timeless"
  region                   = "us-east-1"
}