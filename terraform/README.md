Used terraform open source modules 
ec2 
security group 
alb

Tried to create ec2 and alb with these modules and application logic is derieved using userdata. 

Steps to execute :

Provider.tf contains version constraints
Clone the repo and run 
terraform init
terraform plan 
terraform apply

Output

Load balancer DNS

Improvements: 
1. Use variables instead of direct values in tf files
2. Modules for AMI and other small stuff
3. integrated ansible or remote exec to have better control over app startup
