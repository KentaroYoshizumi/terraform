resource "aws_efs_file_system" "helloworld" {
  tags = {
    Name = "aws-terraform-efs"
  }
}

resource "aws_efs_mount_target" "efs-a" {
  file_system_id  = aws_efs_file_system.helloworld.id
  subnet_id       = aws_subnet.public-a.id
  security_groups = ["${aws_security_group.efs.id}"]
}

resource "aws_efs_mount_target" "efs-c" {
  file_system_id  = aws_efs_file_system.helloworld.id
  subnet_id       = aws_subnet.public-c.id
  security_groups = ["${aws_security_group.efs.id}"]
}

resource "aws_security_group" "efs" {
  name        = "aws-terraform-efs"
  description = "Allow EFS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = ["${aws_security_group.allow.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "efs_id" {
  value = aws_efs_file_system.helloworld.id
}
