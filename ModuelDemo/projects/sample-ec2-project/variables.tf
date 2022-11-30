# Ec2 Variables

variable "instance_type" {
 type = string
 description = " Ec2 Machine type"
}


variable "public_key" {
 type = string
 description = "SSH key attach to  Ec2 instance"
}

variable "KeyName" {
 type = string
 description = "SSh key which will be created"
}

variable "region" {
type = string
 description = "Region where ec2 will launch " 
}

variable "ami_id" {
  type = string
  description = "Image Id"
}


variable "vpc_id" {
    type = string
    description = "VPC ID where jenkins server to Launch"
}

variable "SubnetId" {
  type = string
  description = "Subnet Id"
}


variable "AvailabilityZone" {
  type = string
  description = "Availability Zone in which launching Jenkins server"
}

variable "api_stop" {
 type = bool
 default = null
 description = "This vaiable allow to stop instances through api"
  
}

variable "security_group" {
  type = list
  # default =  ["sg-059c6944b51dfe458"]
  
}


variable "instance-profile" {
 type = string
}

variable "iam_role" {
  type = string
}