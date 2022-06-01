#                                                                               CLOUD COMPUTING
                                                                           
##                                                                              ASSIGNMENT-1                                                                           

## Creating an EC2 Instance using terraform

	Step 1: Configure the aws and install the terraform. Later copy the credentials from the aws lab and paste it in the path given "~/.aws/credentials" to complete the configuration.

	Step 2: Make sure everything is set-up and configured fine by running the command "aws s3 ls". It will display the list of s3 buckets available and should return nothing if no buckets are created.

	Step 3: Create the terraform files (main and variable) using the command "code main.tf" and "code variable.tf"

	Step 4: The main.tf contains the resource blocks (EC2 instance and a S3 bucket) and the terraform backend blocks.

### EC2 Instance block
	
resource "aws_instance" "web_server" {
    ami = "ami-06eecef118bbf9259"
    instance_type = var.inst_type      
    tags = {
        Name = var.inst_name       
    }
}
      
### S3 bucket block

resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "terraform-state-storing-bucket"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

### Terraform backend S3 block for the state file (To change the state file from local to S3 bucket)

terraform {
    backend "s3"{
        bucket = "terraform-state-storing-bucket"
        key = "terraform-state.state"
        region ="us-east-1"
    }
}

	Step 5: The variable.tf file contains the variables that are declared.

### Instance name variable block
	
variable "inst_name" {
    description = "The name of the ec2 instance"
    type = string
    default = "Ec2_Assnmt_instance"
}
      
### Instance type variable block

variable "inst_type" {
    description ="The type of the instance"
    type = string 
    default = "t2.micro"
}

	Step 6: We run the terraform commands to execute the code mentioned above:
#### * terraform init (downlaods the provider files, aws)
#### * terraform plan (To compare the state and display the chnages that will happen)
#### * terraform apply -var="instance_name=Instance_name _from_apply" -var="inst_type=t2.micro" (Execute the code and create the EC2 instance along with the S3 bucke)

The code above overrides the default name given in the variable block with the variable name given through the command line.

	Step 7: After the last command the EC2 instance is created and the state file is stored in the S3 bucket that was created along with the instance.
