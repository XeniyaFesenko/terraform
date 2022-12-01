terraform {
   required_providers {
     aws = {
       source  = "hashicorp/aws"
       version = "~> 3.0"
     }
   }
 }


provider "aws" {
  # access_key = "$"
  # secret_key = "$"
  region     = "us-east-1"
}


#####################################  Create Bucket 
resource "aws_s3_bucket" "state_backup" {
  bucket = "terraform-s3-demo"
  force_destroy = true
  lifecycle {
    prevent_destroy = false
  }
}

# Enable/Disable Encryption
resource  "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.state_backup.bucket
    rule {
        apply_server_side_encryption_by_default {
          sse_algorithm  = "AES256"
        }    
  }
}

# Enable Versioning 
resource "aws_s3_bucket_versioning" "versioning_example" {
   bucket = aws_s3_bucket.state_backup.id
   versioning_configuration {
    status =   "Enabled" # | "Suspended" 
  }
}


################### Create Dynamodb Table #################

resource "aws_dynamodb_table" "terraform-lock" {
  hash_key = "LockID"
  name =  "terraform-dev-lock"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    type =  "S"
    name = "LockID"
  }

}

############### Upload state file in s3 bucket with state lock 
terraform {
  backend "s3" {
    encrypt = true
    bucket= "terraform-s3-demo"
    dynamodb_table = "terraform-lock-dev"
    key = "dev-tfstate/terraformstate"
    region = "us-east-1"
    
  }
} 



resource "aws_ecr_repository" "dev-ecr" {
  name                 = "terraform-docker"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

