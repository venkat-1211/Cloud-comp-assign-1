terraform {
    backend "s3"{
        bucket = "terraform-state-storing-bucket"
        key = "terraform-state.state"
        region ="us-east-1"
    }
}


resource "aws_instance" "web_server" {
    ami = "ami-06eecef118bbf9259"
    instance_type = "t2.micro"
   
   
    tags = {
        Name = var.inst_name       
    }
}
                    
resource "aws_s3_bucket" "main_s3_bucket" {
  bucket = "terraform-state-storing-bucket"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}