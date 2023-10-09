resource "aws_vpc" "golfzon-vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "golfzon-poc"
  }
}

resource "aws_subnet" "golfzon-subnet" {
  vpc_id            = aws_vpc.golfzon-vpc.id
  cidr_block        = "172.16.1.0/24"

  tags = {
    Name = "golfzon-poc"
  }
}

resource "aws_security_group" "golfzon-sg" {
  name        = "golfzon-sg"
  vpc_id      = aws_vpc.golfzon-vpc.id

  ingress {
    description      = "ssh"
    from_port        = 0
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [aws_vpc.golfzon-vpc.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = [aws_vpc.golfzon-vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "golfzon-poc"
  }
}