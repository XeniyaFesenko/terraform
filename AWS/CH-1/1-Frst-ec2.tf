provider "aws" {
    region = "us-east-1"
    # access_key =  ""  Insert your access Key
    # secret_key = ""  Insert you secret Key
}

# Create a Ec2 Instances
resource "aws_instance" "First-Demo" {

    ami = "ami-01216e7612243e0ef"
    instance_type = "t2.micro"
    tags = {
      "Name" = "First-Ec2"
    }
  
}
