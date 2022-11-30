
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "jenkins" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.KeyName
  availability_zone = var.AvailabilityZone
  disable_api_termination = var.api_stop
  vpc_security_group_ids = var.security_group
  subnet_id = var.SubnetId
  iam_instance_profile = aws_iam_instance_profile.session-manager.name
  user_data = file("bootstrap.sh")
  user_data_replace_on_change = true
  tags = {
    "Name" = "Jenkins-Server"
    "Env" = "Dev"
    "Project" = "Alpha"
    "Created_By" = "terraform"
  }
}



resource "aws_key_pair" "jenkins" {
  key_name   = var.KeyName
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnQXfvyjev4SfR02QKQZrNMJQvX4hrqyCEj98E0FYW+TOSe9zpg6kb6TIQjmg2tPFNRaWhUsQNSatdlSEpRQ/2QamG8WZUGRkA1S9594E6dsfDYEQkbHW5olVRWWZDu/Fv+9BTuWbf5GLPpzzZJG5iY32sDg6S1FxZWZJvFJ8l9pqwxDdwpy9MhVmuVxkUFH0wTv790u47MP3Nl2EHyezm9Lh+pHarz72tsmXuk/vv2BQ/Bv34XRKQwBKs/BOiAjGGrQDdoiG1YYYdNBFNWOP4X4OY91LODikBdY46+9oV8oDVTxYLv7+C7UcnyTLPOzC5WJBos7ufZEZH7WwwBBQ6ds0nPZtvCR3p17rmuvL9oJFiNA9n4WzL90UAydlQhVH6p9UgjVGMfDHi/hc7g6rW3GTOkseKa7wd/bv3pL02+VnkEOGAc7wtw9A8oFtvlm5XZQ17GYpA2CXSKMsItUum7dRbz0n4F5kknhGTurypuepI1UG/sXiifoXFnXtw1xc= arvind@k8smaster"
}

resource "aws_iam_instance_profile" "session-manager" { 
  name = var.instance-profile
  role =   aws_iam_role.jenkins_ssm_role.name
}

resource "aws_iam_role" "jenkins_ssm_role" {
  name = "jenkins_ssm_role"
  assume_role_policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": "sts:AssumeRole",
                    "Principal": {
                    "Service": "ec2.amazonaws.com"
                    },
                    "Effect": "Allow",
                    "Sid": ""
                }
            ]
        }
EOF
}

resource "aws_iam_role_policy_attachment" "ssm-policy" {
 role       = aws_iam_role.jenkins_ssm_role.name
 policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}


#### Remote state ####
terraform {
  backend "s3" {
    bucket = "terraformstae"
    key    = "testingstate/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table= "terraformstate"
  }
    
  }


# data "terraform_remote_state" "state" {
#   backend = "s3"
#   config = {
#     bucket = "terraformstae"
#     key    = "testingstate/terraform.tfstate"
#     region = "us-east-1"
#     dynamodb_table= "terraformstate"
#   }
# }

