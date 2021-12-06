variable "project" {
  default = "uno"
}
variable "region" {
  default = "ap-south-1"
  
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "ami" {
  default = "ami-052cef05d01020f1d"  
}

variable "type" {
  default = "t2.micro"
} 


