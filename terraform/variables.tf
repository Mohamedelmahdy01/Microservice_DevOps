variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-0c55b0a648768786c" 
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to use"
  default     = "my-key-pair" 
}