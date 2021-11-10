# AWS Controls
Terraform code for deploying a AWS Infrastructure with multiple security controls

#Permissions PEM file:
icacls EC2Keypair.pem /grant NB27015:F & Disable all inherited permissions

#Access EC2 via SSH:
ssh -i EC2Keypair.pem ec2-user@3.251.97.22

1. Clone PoC:
git clone https://github.com/SanderKnape/aws-cognito-app.git

2. Create .env file:
cd aws-cognito-app
printf "REGION=eu-west-1 \nCLIENT_ID=46tv6cjnvofp4c0b932930imbf \nUSERPOOL_ID=eu-west-1_C3OqBeegH" > .env

3. Run PoC:
docker-compose up -d