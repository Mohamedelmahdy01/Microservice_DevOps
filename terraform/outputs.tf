output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.compute.instance_public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.compute.instance_id
}