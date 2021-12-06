

# =====================================================
# Find Image Id
# =====================================================


data "aws_ami" "amazon_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["amazon"] # Canonical
}

# =====================================================
# Creating Public Key
# =====================================================

resource "aws_key_pair"  "key" {
 
  key_name   = "terraform"
  public_key = file("./../terraform.pub")
  tags     = {
    Name    = "${var.project}-key"
    project = var.project
  }
}

# =====================================================
# Creating Ec2 Instance For Frontend
# =====================================================

resource "aws_instance"  "frontend" {
    
  ami                          =  data.aws_ami.amazon_image.id
  instance_type                =  var.type
  subnet_id                    =  aws_subnet.Public1.id
  key_name                     =  aws_key_pair.key.id
  vpc_security_group_ids       =  [  aws_security_group.frontend.id ]
  user_data                    =  file("setup.sh")
  tags     = {
    Name    = "${var.project}-frontend"
    project = var.project
  }
    
}

# =====================================================
# Creating Ec2 Instance For Backend
# =====================================================

resource "aws_instance"  "backend" {
    
  ami                          =  data.aws_ami.amazon_image.id
  instance_type                =  var.type
  subnet_id                    =  aws_subnet.private1.id
  key_name                     =  aws_key_pair.key.id
  vpc_security_group_ids       =  [  aws_security_group.backend.id  ]
  user_data                    =  file("setup.sh")
  tags     = {
    Name    = "${var.project}-backend"
    project = var.project
  }
    
}


# =====================================================
# Creating Ec2 Instance For Bastion
# =====================================================

resource "aws_instance"  "bastion" {
    
  ami                          =  data.aws_ami.amazon_image.id
  instance_type                =  var.type
  subnet_id                    =  aws_subnet.Public2.id
  key_name                     =  aws_key_pair.key.id
  vpc_security_group_ids       =  [  aws_security_group.bastion.id  ]
  #user_data                    =  file("setup.sh")
  tags     = {
    Name    = "${var.project}-bastion"
    project = var.project
  }
    
}
