terraform {
  backend "s3" {
    bucket = "abhi-project-mario" # Replace with your actual S3 bucket name
    key    = "EKS/terraform.tfstate"
    region = "ap-south-1"
    profile = "eks"
  }
}
