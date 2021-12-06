# =====================================================
# RouteTable Creation public
# =====================================================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

 
  tags = {
    Name    = "${var.project}-route-public"
    project = var.project
  }
}

# =====================================================
# RouteTable Creation private
# =====================================================

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat.id
  }

 
  tags = {
    Name    = "${var.project}-route-private"
    project = var.project
  }
}



# =====================================================
# RouteTable Association subnet Public1-3 to rtb public
# =====================================================

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.Public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.Public2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.Public3.id
  route_table_id = aws_route_table.public.id
}

# =====================================================
# RouteTable Association subnet private1-3 to rtb private
# =====================================================


resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private.id
}