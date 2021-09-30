terraform {
  backend "s3" {
    bucket = "assignment-bucket-tf"
    key    = "terraform"
    region = "us-east-2"
  }
}