# =====================================================
# Fetching Az Names
# =====================================================

data "aws_availability_zones" "az" {
    
  state = "available"

}


# =====================================================
#           vpc Creation
# =====================================================


resource "aws_vpc" "vpc" {
  cidr_block             = var.vpc_cidr
  instance_tenancy       = "default"
  enable_dns_support     = true
  enable_dns_hostnames   = true

lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.project}-vpc"
    project = var.project
  }
}

# =====================================================
# Attaching Internet gateWay
# =====================================================

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name    = "${var.project}-igw"
    project = var.project
  }
}

# =====================================================
# Elatic Ip Allocation
# =====================================================


resource "aws_eip" "eip" {
  vpc       = true
  tags = {
    Name    = "${var.project}-nat-eip"
    project = var.project
  }
}

# =====================================================
# Creating Nat GateWay
# =====================================================


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.Public2.id

  tags = {
    Name    = "${var.project}-nat-eip"
    project = var.project
  }
}