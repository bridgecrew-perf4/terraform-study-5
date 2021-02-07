resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-025eb5dcb52def1e3" # subnet existente na VPC default da região us-east-1
  #  key_name      = "<arquivo.pem>"

  tags = {
    Name = "terraform-study"
  }
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = "aws_instance.web.id"
}