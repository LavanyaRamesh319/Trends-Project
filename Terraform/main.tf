terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-2"
}

resource "aws_vpc" "trend_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = true

  enable_dns_hostnames = true

  tags = {
    Name = "trend_vpc"
  }
}

resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.trend_vpc.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-south-2a"

  map_public_ip_on_launch = true

  tags = {
    Name = "trend-public-subnet"
  }
}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.trend_vpc.id

  tags = {
    Name = "trend-igw"
  }
}

resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.trend_vpc.id

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "trend-public-route-table"
  }
}

resource "aws_route_table_association" "public_assoc" {

  subnet_id = aws_subnet.public_subnet.id

  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "jenkins_sg" {

  name        = "jenkins-security-group"
  description = "Security Group for Jenkins"
  vpc_id      = aws_vpc.trend_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "React Test"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "jenkins-sg"
  }
}

resource "aws_iam_role" "ec2_role" {

  name = "TrendEC2Role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [

      {

        Effect = "Allow"

        Principal = {

          Service = "ec2.amazonaws.com"

        }

        Action = "sts:AssumeRole"

      }

    ]

  })

}

resource "aws_iam_role_policy_attachment" "admin_attach" {

  role = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"

}

resource "aws_iam_instance_profile" "instance_profile" {

  name = "TrendInstanceProfile"

  role = aws_iam_role.ec2_role.name

}

data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {

    name = "name"

    values = ["amzn2-ami-hvm-*-x86_64-gp2"]

  }

}

resource "aws_instance" "jenkins_server" {

  ami                    = data.aws_ami.amazon_linux.id

  instance_type          = "t3.medium"

  subnet_id              = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  iam_instance_profile   = aws_iam_instance_profile.instance_profile.name

  associate_public_ip_address = true

  key_name = "awskey"

  tags = {

    Name = "Jenkins-Server"

  }

}
