# terraform-aws-consul

This repo demonstrates how to create Consul cluster in AWS using Terraform.

## Prerequisites

Following things are required in order to be able to run these scripts:  
 - [Terraform](https://www.terraform.io/intro/getting-started/install.html)  
 - AWS account. For more info please check following section [Understanding and getting your AWS credentials](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html).

## Provision Consul cluster

The intention of scripts is to create Consul cluster.
```bash
# Initialize terraform first time using
terraform init

# See a plan of what will be created
terraform plan

# Execute a plan. Create a cluster!
terraform apply
```
Navigate to port 8500 of. Use any public IP address taken from output. 

> Note 1: please change default values in `variables.tf` file according to your needs.  
> Note 2: Encryption key can be generated upfront ony any node with Consul service installed.   
> Note 3: VPC, Subnet, security groups should exist prior to execution of these scripts.   

## Destroying the Cluster

Bring everything down with:

```
terraform destroy
```

## Project Structure

Project has the following structure
```
main.tf                   # Scripts to provision Consul cluster
variables.tf              # Variables with default values
output.tf/                # Output values
conf/                     # Configuration files for Consul cluster
scripts/                  # Scripts used during provisiong process
```

## Notes
Please check [Required Ports](https://www.consul.io/docs/install/ports) section.

## Next steps or what is missing?
 - Add scripts to create VPC, subnet, security group. Currently default ones are being used.  
 - One important thing to work on is also additional parametrization which should be added in order scripts can become more complete.
 - Don't use public ami, but create your own one

> This scripts were tested with Terraform v0.13.2 
