resource "aws_instance" "jenkins" {
  ami = var.ami_id
  instance_type = var.instance_type
  key_name =  var.KeyName
  availability_zone = var.AvailabilityZone
  disable_api_termination =  var.api_stop
  vpc_security_group_ids  = var.security_group
  subnet_id =  var.SubnetId
  iam_instance_profile = aws_iam_instance_profile.session-manager.name
  user_data = file("../../modules/ec2/bootstrap.sh")
  user_data_replace_on_change = true
  tags = {
    "Name" = "Jenkins-Server"
    "Env" = "Dev"
    "Project" = "Alpha"
    "Created_By" = "terraform"
  }
}



resource "aws_key_pair" "ssh_key" {
  key_name   = var.KeyName
  public_key = var.public_key
}

resource "aws_iam_instance_profile" "session-manager" { 
  name =   var.instance-profile
  role =   aws_iam_role.ssm_role.name
}

resource "aws_iam_role" "ssm_role" {
  name = var.instance-profile
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
 role       = aws_iam_role.ssm_role.name
 policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}