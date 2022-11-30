variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
    default = "ami-08c40ec9ead489470"
    description = "Image Id"
}

variable "vpc_id" {
    default = "vpc-017062a16ef6eb233"
    description = "VPC ID where jenkins server to Launch"
}
variable "SubnetId" {
  default = "subnet-01209769b9f48ed0d"
  description = "Subnet Id"
}

variable "AvailabilityZone" {
  default = "us-east-1c" # us-gov-west-1a
  description = "Availability Zone in which launching Jenkins server"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "KeyName" {
  default = "jenkins-server"
}

variable "api_stop" {
    default = null
    description = "This vaiable allow to stop instances through api"
  
}
variable "security_group" {
  default =  ["sg-059c6944b51dfe458"]
  
}


variable "instance-profile" {
  default = "session-manager"
}

variable "jenkins_ssm_role" {
  default = "jenkins-ssm-role"
}