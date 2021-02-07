data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Ubuntu
}

resource "aws_instance" "web" {
  count         = var.servers
  ami           = var.image_id
  instance_type = "t2.micro"
#  subnet_id     = "<subnet>"
#  key_name      = "<arquivo.pem>"

  tags = {
    Name = "HelloWorld"
  }
  depends_on = [ aws_instance.web ]
}

resource "aws_eip" "ip" {
  vpc = true
  instance = "aws_instance.web.id"
}