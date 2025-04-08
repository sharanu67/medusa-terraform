resource "aws_vpc" "medusa_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.medusa_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.medusa_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"
}

resource "aws_internet_gateway" "medusa_igw" {
  vpc_id = aws_vpc.medusa_vpc.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.medusa_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.medusa_igw.id
  }
}

resource "aws_route_table_association" "subnet1_assoc" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "subnet2_assoc" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}








#resource "aws_vpc" "medusa_vpc" {
#  cidr_block = "10.0.0.0/16"
#}

#resource "aws_vpc" "medusa_vpc" {
#  cidr_block = var.vpc_cidr
#}

#resource "aws_subnet" "public_subnet_1" {
#  vpc_id                  = aws_vpc.medusa_vpc.id
#  cidr_block              = "10.0.1.0/24"
#  map_public_ip_on_launch = true
#  availability_zone       = "us-east-1a"
#}

#resource "aws_subnet" "public_subnet_2" {
#  vpc_id                  = aws_vpc.medusa_vpc.id
#  cidr_block              = "10.0.2.0/24"
#  map_public_ip_on_launch = true
#  availability_zone       = "us-east-1b"
#}


#resource "aws_security_group" "medusa_sg" {
#  vpc_id = aws_vpc.medusa_vpc.id

#  ingress {
#    from_port   = 80
#    to_port     = 80
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  ingress {
#    from_port   = 443
#    to_port     = 443
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }

#  egress {
#    from_port   = 0
#    to_port     = 0
#    protocol    = "-1"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

