resource "aws_subnet" "public_subnets" {
  count             = length(var.subnet_cidrs)
  vpc_id           = var.vpc_id
  cidr_block       = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "Public-Subnet-${count.index + 1}"
  }
}

