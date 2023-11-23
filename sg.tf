# Create Web Security Group
resource "aws_security_group" "web-sg" {
  name        = var.security_group
  description = "Allow ssh and http inbound traffic"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description = "ingress port "
    #from_port   = ingress.value
    from_port   = var.from_port1
    to_port     = var.to_port1
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "ingress port "
    #from_port   = ingress.value
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "docker-Web-SG"
  }
}