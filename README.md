# Technical_Challenge
It contains 3 online Tech Challenge Folders

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


  



