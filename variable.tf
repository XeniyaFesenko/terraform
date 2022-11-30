
variable "env" {
  default = "dev"
  description = "Environemnt name"  
}


variable "bucket_name" {
    default = "terraformstatebkp-dev"
    description = "Terraform State backup bucket"
}

variable "region" {
  default = "us-east-1"
  desdescription = "Region where code will deploy"  
}


########## Jenkins Server Variables ########

variable "ami_id" {
    default = "ami-00ae5d2b6b624712e"
    description = "Image Id"
}

variable "vpc_id" {
    default = "vpc-094de6c7c63b731c7"
    description = "VPC ID where jenkins server to Launch"
}
variable "SubnetId" {
  default = "subnet-03efab732811c4fad"
  description = "Subnet Id"
}

variable "AvailabilityZone" {
  default = "us-east-1" # us-gov-west-1a
  description = "Availability Zone in which launching Jenkins server"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "KeyName" {
  default = "demo.pem"
}
