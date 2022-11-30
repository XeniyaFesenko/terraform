#!/bin/bash
echo "Changing server name"
sudo hostnamectl set-hostname "jenkins-server"
sudo apt update -y
sudo apt install openjdk-11-jdk  awscli  python3 -y 
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins -y
sudo systemctl daemon-reload
sudo systemctl start jenkins
sudo systemctl enable jenkins
# mkdir /tmp/ssm 
# cd /tmp/ssm 
# wget https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/debian_amd64/amazon-ssm-agent.deb
# sudo dpkg -i amazon-ssm-agent.deb
# sudo systemctl enable --now  amazon-ssm-agent