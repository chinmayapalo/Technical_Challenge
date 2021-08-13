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

Option -1 (  Using terraform.tfvars file )

      Need to set the value of AWS_ACCESS_KEY & AWS_SECRET_KEY inside terraform.tfvars file. 
      
      Please uncomment the below mentioned codes in main.tf , If the same has already commented.
            access_key = var.AWS_ACCESS_KEY # AWS Access key
            secret_key = var.AWS_SECRET_KEY # AWS Secret Access Key
            
      Comment the code ( profile    = "default" ) in main.tf

Option -2 ( Set_up AWS profile in your system )

      Before starting with Terraform you should have configured your credentials in the AWS folder in your system as shown below.
      
      [default]
      aws_access_key_id = 
      aws_secret_access_key = 
      [prod]
      aws_access_key_id =
      aws_secret_access_key =

      The name for the accounts can be anything you want but make sure that in the "main.tf" file that your are using the appropriate name for the profile when 
      configuring.
      
      Comment  these codes [ access_key = var.AWS_ACCESS_KEY  & secret_key = var.AWS_SECRET_KEY ] inside main.tf file 
      
      Update profile value [ profile    = "default"  ] in main.tf code for profile based access.
 

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
      
      Nat gateway - 01 , mapped with private route table
      
Security Groups :

Have created security groups for 
      
            1) External ALB
            2) Web server instances
            3) Internal ALB
            4) Application server instances
            5) Database
            6) Bastion Host

WebServer Tier :

      Create a Application load balancer for web servers in public subnet
      Create target groups for ALB  and add instances to that group
      Creating a autoscaling group of instances for web servers [ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-* ]
      Launch the web servers in Public subnet
      
Application Tier :

      Create a Application load balancer for Application servers in private subnet
      Create target groups for ALB and add instances to that group
      Creating a autoscaling group of instances for App servers [ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-* ]
      Launch the App servers in Private subnet

Data Tier :

      Create a RDS  with multi az feature inside private subnets.
      
S3 bucket :

      Create a s3 bucket with a server side encryption & versioning enabled to store static contents , files.


For Demo purposes  I have used 

      Apache both on web servers & Application servers. 
      app.sh - apache installation script for application server
      web.sh - apache installation script for web server

I have created one bastion host.

AMI :

       ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*  
       virtualization-type = hvm
       Root_device_type = ebs

How to Provision Infrastructure :

      Clone the git repository: $ git clone 
      go to the "Challenge_1" directory and set variables in "terraform.tfvars" file:
      Initialize the terraform from the terminal by executing  'terraform init' command
      Run 'terraform fmt' . This ensures your formatting is correct and will modify the code for you to match.
      Run 'terraform validate' to ensure there are no syntax errors.
      Run 'terraform plan' to see what resources will be created.
      Run terraform apply to create your infrastructure. 
      
Testing

      Once infrastructure has been created there should be an Output displayed on your terminal with 'Web_Server_Load_Balancer_Endpoint= ' for the External ALB.
      Please use the URL to access your applications.
      
Clean Up

      To delete our infrastructure run 'terraform destroy' . This command will delete all the infrastructure that we created.


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
        
 Testing
 
      Test_case 01 : 
           Input 
            data : test_data1.json
            key  : 'x/y/z'
           
           Output : value = a
           
      Test_case 02 : 
           Input 
            data : test_data2.json
            key  : 'a/b/c'
           
           Output : value = d


  



