# Create VPC
resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Project = "Terraform state management"
    Name    = "${var.candidate_name}-vpc"
  }
}
