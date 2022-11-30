
# Simple Terraform module of Ec2 ##

In this Project we are going to create a Sample EC2 Instances which will run Jenkins server 


## Prerequisities 
  1. VPC 
  2. Subnet 
  3. Security Group 

## Info ##  
### To run this code 
1.  Take the clone on git repo 
2.  Switch to terraform/ModuelDemo/projects/sample-ec2-project directory 
## Run ##

* terraform init 
* terraform plan  --var-file=main.tfvars
* terrafomr apply --var-file=main.tfvars --auto-approve

### Note: 
*To Make changes according to you requirement  Just update resources name  in main.tfvars file.*
