resource "aws_instance" "bastion-host" {
  ami           = "ami-0d1ddd83282187d18"
  instance_type = "t3.nano"


  key_name = "timeless-staging-bastion"

  vpc_security_group_ids = [aws_security_group.bastion_host_sg.id]

  tags = {
    Name = "timeless-bastion-host"
  }
}

resource "aws_security_group" "bastion_host_sg" {

  description = "Host SG"
  name        = "bastion-host-sg"
  vpc_id      = "vpc-00b7fd2a39f7ce98f"

  # inbound rule for Bastion Host SSH
  ingress {
    description = "Bastion Host SG"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output from Bastion Host"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
