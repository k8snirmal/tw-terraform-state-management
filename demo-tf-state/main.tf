# Create VPC
resource "aws_vpc" "demo_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Project = "Terraform state management"
    Name    = "${var.candidate_name}-vpc"
  }
}

#create subnet
#public subnet
resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.1.0/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public-1"
  }
}
resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.2.0/28"
  availability_zone = "us-east-1b"
  tags = {
    Name = "public-1"
  }
}
#private subnet
resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.50.0/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private-1"
  }
}
resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.51.0/28"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private-1"
  }
}
#db subnet
resource "aws_subnet" "db-1" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.100.0/28"
  availability_zone = "us-east-1a"
  tags = {
    Name = "db-1"
  }
}
resource "aws_subnet" "db-2" {
  vpc_id     = aws_vpc.demo_vpc.id
  cidr_block = "172.16.101.0/28"
  availability_zone = "us-east-1b"
  tags = {
    Name = "db-1"
  }
}

#igw
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "main"
  }
}
#IGW attchment
resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.gw.id
  vpc_id              = aws_vpc.demo_vpc.id
}

#nat gateway
resource "aws_nat_gateway" "NG" {
  allocation_id = aws_eip.myEIP.id
  subnet_id     = aws_subnet.public-1.id
  depends_on                = [aws_internet_gateway.gw]
}
#EIP
resource "aws_eip" "myEIP" {
  vpc = true
  instance                  = aws_nat_gateway.NG.id
  associate_with_private_ip = "10.0.0.12"
  depends_on                = [aws_internet_gateway.gw]
}
 #EC2
 resource "aws_instance" "private-ec2" {
  name                    = "vm1"
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t3.micro"
  availability_zone       = "us-east-1a"
  subnet_id               = "aws_subnet.private-1.id
}
 resource "aws_instance" "private-ec2" {
  name                    = "vm2"
  ami                     = "ami-0dcc1e21636832c5d"
  instance_type           = "t3.micro"
  availability_zone       = "us-east-1b"
  subnet_id               = "aws_subnet.private-2.id
}
#routetable
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    natgateway_id = aws_nat_gateway.NG.id
  }
}
resource "aws_route_table" "DB-route-table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "172.16.0.0/16"
  }
}
#subnet association with route table
resource "aws_route_table_association" "public" {
  subnet_id      = [aws_subnet.public-1.id,aws_subnet.public-2.id]
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = [aws_subnet.private-1.id,aws_subnet.private-2.id]
  route_table_id = aws_route_table.private-route-table.id
}
resource "aws_route_table_association" "db" {
  subnet_id      = [aws_subnet.db-1.id,aws_subnet.db-2.id]
  route_table_id = aws_route_table.db-route-table.id
}


