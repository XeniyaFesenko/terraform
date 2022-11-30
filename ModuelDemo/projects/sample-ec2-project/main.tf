module "ec2" {
    source = "../../modules/ec2"
    public_key = var.public_key
    iam_role = var.iam_role
    KeyName = var.KeyName
    instance_type =var.instance_type
    AvailabilityZone = var.AvailabilityZone
    SubnetId = var.SubnetId
    instance-profile = var.instance-profile
    ami_id = var.ami_id
    region = var.region
    vpc_id = var.vpc_id
    security_group = var.security_group
}