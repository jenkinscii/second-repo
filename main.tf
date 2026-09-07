resource "aws_security_group" "instance" {
  name        = "${var.name}-sg"
  description = "Allow SSH access to the EC2 instance"
  vpc_id      = data.aws_subnet.selected.vpc_id

  ingress {
    description = "SSH from the administrator network"
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.admin_cidr]
  }

  egress {
    description = "Allow outbound traffic"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name}-sg"
  }
}

resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [aws_security_group.instance.id]
  key_name                    = var.key_name
  associate_public_ip_address = true

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = var.name
  }
}

data "aws_subnet" "selected" {
  id = var.subnet_id
}