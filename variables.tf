variable "inst_name" {
    description = "The name of the ec2 instance"
    type = string
    default = "Ec2_Assnmt_instance"

}

variable "inst_type" {
    description ="The type of the instance"
    type = string 
    default = "t2.micro"
}
