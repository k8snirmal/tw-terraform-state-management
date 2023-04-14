output "vpc_id" {
  description = "VPC ID of the AWS VPC"
  value       = aws_vpc.demo_vpc.id
}
