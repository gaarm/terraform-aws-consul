# terraform-aws-consul

This repo demonstrates how to create Consul cluster in AWS using Terraform.

## Prerequisites

Following things are required in order to be able to run these scripts:  
0. [Terraform](https://www.terraform.io/intro/getting-started/install.html)  
1. AWS account. For more info please check following section [Understanding and getting your AWS credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html).

## Provision Consul cluster

The intention of scripts is to create Consul cluster.
You can use following commands in order to 
```bash
# Initialize terraform first time using
terraform init

# See a plan of what will be created
terraform plan

# Execute a plan. Create a cluster!
terraform apply
```

Navigate to port 8500 of. Use any public IP address taken from output. 

## Destroying the Cluster

Bring everything down with:

```
terraform destroy
```

## Project Structure

Project has the following structure
```
main.tf                   # Scripts to provision Consul cluster.
variables.tf              # Variables with default values.
output.tf/                # Output values
conf/                     # Configuration files for Consul cluster
scripts/                  # Scripts used during provisiong process
```

