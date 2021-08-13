# Technical_Challenge
It contains 3 online Tech Challenge Folders

# Challenge -1 ( AWS + Terraform )

Need to set-up a 3 tier infrastructure in aws using Terraform.

# Terraform: Deploy A Three-Tier Architecture in AWS


Prerequisites : 

      1) Install Terraform
      2) Install the AWS CLI
      3) Sign up for an AWS Account
      4) Your preferred IDE (I used Atom Editor)

Configuration of AWS credentials:

Option -1

      Need to set the value of AWS_ACCESS_KEY & AWS_SECRET_KEY inside terraform.tfvars file. 
      Uncommented the below codes inside provider module in main.tf , If the same has been commented.
            access_key = var.AWS_ACCESS_KEY # AWS Access key
            secret_key = var.AWS_SECRET_KEY # AWS Secret Access Key
      Comment out profile    = "default" code

Option -2

Before starting with Terraform you should have configured your credentials in the AWS folder in your system as shown below.
[default]
aws_access_key_id = 
aws_secret_access_key = 
[prod]
aws_access_key_id =
aws_secret_access_key =

The name for the accounts can be anything you want but make sure that in the "main.tf" file that your are using the appropriate name for the profile when configuring. 
      Comment out these codes ( access_key = var.AWS_ACCESS_KEY # AWS Access key & secret_key = var.AWS_SECRET_KEY # AWS Secret Access Key )
      Ues --> profile    = "default" code for profile based access.
            
 

Three-tier :

Three tier is industry standard for modern web application where we have 3 tiers for following

WebServer tier (WebAPP tier): Prepares HTMLs by calling App tier
Application tier (App tier): Prepare data by calling DB or other third party services
Database tier (DB tier): Stores the data in database.

Creating three architecture in AWS, I have used the below mentioned resources.

Architecture overview :

VPC

      Public subnet -  02 public subnets.  public_subnet_1 & public_subnet_2. These are for hosting public instances.

      Private Subnet - 02 Private subnets. private_subnet_1 & private_subnet_2. These are for hosting private instances.
      
      bastion_subnet - 01 , For bastion host.
      
      Public Route Table - 01 , public subnets have mapped with this route table.
      
      Private Route Table - 01 , private subnets have mapped with this route table.
      
      Internet gateway - 01 , mapped with public route table
      
      Elastic Ip - 01 , Used for nat gateway
      
      Nat gateway - 01 , ma pped with private route table
      
Security Groups :

Have created security groups for 
      
            1) External ALB
            2) Web server instances
            3) Internal ALB
            4) Application server instances
            5) Database
            6) Bastion Host



Create a Application load balancer for web servers

Create target groups for ALB  and add instances to that group

Creating a autoscaling group of instances for web servers [linux based either ubuntu or                         Redhat ]

Launch the web servers in Public Sunet

Create a Application load balancer for Application servers

Create target groups for ALB and add instances to that group

Creating a autoscaling group of instances for Application servers [Linux based either ubuntu or Redhat]

Launch the Application servers in Private Subnet

Create a RDS  with replication feature connected to application servers

For Demo purposes  we will :

use nginx on Web Servers

Use Apache on Application Servers




# Challenge -2

Need to write code that will query the meta data of instance within AWS.

What do you need for this task ?

  1) AWS Account
  2) Knowledge on AWS services & Python
  3) Python IDLE / Any Editor for command line
  4) Python-2.x / Python-3.x
  5) Boto3 - This is a python SDK for AWS
  
Environment Setup on server :

  1) Install python-3.x & pip3
  2) Set Paths for Python & pip3
  3) Install boto3 --> pip3 install boto3
  4) Configure credentials of your AWS account on server by using awscli commands 
        Install awscli   --> pip3 install awscli
        Configure Root / IAM user access-keys / credentials using :
            aws configure --profile root
            aws configure --profile non-prod/IAM_user
            
            
Execution of the python script :

Change directory to Challenge_2 folder & execute python3 Instance_Metadata.py

Note :  To query meta data of other AWS services , needs to update service_name="", region_name="" inside the client object.


# Challenge -3

Need to write a function that takes input as a nested object & a key , return back the value as a output

What do you need for this task ?

  1) Knowledge Python
  2) Python IDLE / Any Editor for command line
  3) Python-2.x / Python-3.x
  
Environment Setup on server :

  1) Install python-3.x 
  2) Set Paths for Python
            
            
python script files :

          1) Recursive.py --> Python function . 
             Input parameters --> Nested Json object , key 
             Output --> Value 

          2) Test_case.py --> Unittest python script file which has the test cases for validating Recursive.py

          3) Sample Data file for testing purpose --> test_data1.json , test_data2.json
          
 Execution of the python script :
 
        Change directory to Challenge_3 folder & execute  python3 Test_case.py


  



