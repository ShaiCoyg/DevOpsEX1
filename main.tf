terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

# Create a VPC
resource "aws_vpc" "shai" {
  cidr_block = "192.168.2.0/24"
  tags = {
    "name" = "shai-vpc"
  }
}

# subnet_web #
resource "aws_subnet" "subnet_web" {
  vpc_id     = aws_vpc.shai.id
  cidr_block = "192.168.2.0/27"
  tags = {
    Name = "web"
  }
}

# subnet_app #
resource "aws_subnet" "subnet_app" {
  vpc_id     = aws_vpc.shai.id
  cidr_block = "192.168.2.32/27"

  tags = {
    Name = "app"
  }
}

# subnet_db #
resource "aws_subnet" "subnet_db" {
  vpc_id     = aws_vpc.shai.id
  cidr_block = "192.168.2.64/28"

  tags = {
    Name = "db"
  }
}
