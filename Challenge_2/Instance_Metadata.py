import boto3
from pprint import pprint


aws_mag_con = boto3.session.Session(profile_name="root")
ec2_con_cli = aws_mag_con.client(service_name="ec2", region_name="ap-south-1")

response = ec2_con_cli.describe_instances()['Reservations']

for grp_instances in response:
    # pprint(grp_instances)
    for each_instance in grp_instances['Instances']:
        pprint(each_instance)
        print("==========================")
        pprint("The Image ID is: {}\nThe Instance ID Is: {}\nThe Instance Type is: {}".format(each_instance['ImageId'],each_instance['InstanceId'],each_instance['InstanceType']))
