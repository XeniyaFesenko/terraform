output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       =  aws_instance.jenkins.public_ip
}


output "inline_policy" {
  description = "Policy attached with Role"
  value = aws_iam_role.ssm_role.assume_role_policy
}