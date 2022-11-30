output "s3_bucket_for_state_backup" {
  value = "aws_s3_bucket.state_backup.arn"
  description = "AWS s3 bucket name where terraform staefile store" 
}

output "dynamodb_table_name" {
  value = "aws_dynamodb_table.terraform-lock.id"
  description = "Dynamodb Table Name where state file locks"
}