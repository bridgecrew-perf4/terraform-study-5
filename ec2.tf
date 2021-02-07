data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  ami           = var.image_id
  instance_type = "t2.micro"
  subnet_id     = "subnet-025eb5dcb52def1e3" # subnet existente na VPC default da região us-east-1
#  key_name      = "<arquivo.pem>"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_eip" "ip" {
  vpc = true
  instance = "aws_instance.web.id"
}