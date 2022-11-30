# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A VM IN AWS
#-----------------------------------------------------------------------------------------------------------------------
#

provider "aws" {
  access_key = "your-access-key-here"
  secret_key = "your-secret_key-here"
  region     = "your-region-here"
}

resource "aws_instance" "example" {
  ami           = "ami-00b6a8a2bd28daf19"
  instance_type = "t2.micro"
}
