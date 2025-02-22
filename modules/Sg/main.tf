resource "aws_security_group" "sg" {
  vpc_id = var.vpc_id
  tags = { Name = "MySecurityGroup" }
}

resource "aws_security_group_rule" "allow_all_outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol         = "-1"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}
