# =====================================================
# Creating Subnets Public1
# =====================================================

resource "aws_subnet" "Public1" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = cidrsubnet(var.vpc_cidr,3,0)
  availability_zone                 = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch           = true
  tags = {
    Name = "${var.project}-public1-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets Public2
# =====================================================

resource "aws_subnet" "Public2" {
  vpc_id                                = aws_vpc.vpc.id
  cidr_block                            = cidrsubnet(var.vpc_cidr,3,1)
  availability_zone                     = data.aws_availability_zones.az.names[1]
  map_public_ip_on_launch               = true

  tags = {
    Name = "${var.project}-public2-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets Public3
# =====================================================

resource "aws_subnet" "Public3" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = cidrsubnet(var.vpc_cidr,3,2)
  availability_zone                 = data.aws_availability_zones.az.names[2]
  map_public_ip_on_launch           = true

  tags = {
    Name = "${var.project}-public3-sg"
    project = var.project
  }
}


#=================================================================================================


# =====================================================
# Creating Subnets private1
# =====================================================

resource "aws_subnet" "private1" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = cidrsubnet(var.vpc_cidr,3,3)
  availability_zone                 = data.aws_availability_zones.az.names[0]
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private1-sg"
    project = var.project
  }
}



# =====================================================
# Creating Subnets private2
# =====================================================

resource "aws_subnet" "private2" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = cidrsubnet(var.vpc_cidr,3,4)
  availability_zone                 = data.aws_availability_zones.az.names[1]
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private2-sg"
    project = var.project
  }
}


# =====================================================
# Creating Subnets private3
# =====================================================

resource "aws_subnet" "private3" {
  vpc_id                            = aws_vpc.vpc.id
  cidr_block                        = cidrsubnet(var.vpc_cidr,3,5)
  availability_zone                 = data.aws_availability_zones.az.names[2]
  map_public_ip_on_launch           = false

  tags = {
    Name = "${var.project}-private3-sg"
    project = var.project
  }
}

