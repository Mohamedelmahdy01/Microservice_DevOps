variable "ami_id" {
  description = "AMI ID for the instance"
}

variable "instance_type" {
  description = "EC2 instance type"
}

variable "subnet_id" {
  description = "Subnet ID to place the instance in"
}

variable "security_group_ids" {
  description = "List of security group IDs"
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair to use"
}

resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.ssh_key_name

  tags = {
    Name = "main-ec2-instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "instance_id" {
    value = aws_instance.ec2_instance.id
}