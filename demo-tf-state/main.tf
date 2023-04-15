# Create VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Project = "Terraform state management"
    Name    = "${var.candidate_name}-vpc"
  }
}

#create subnet
resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}
