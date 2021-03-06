#-------------My First Terraform template-----------
#
# Made by Evgeny Mrykhin  on  01-February.2019
#---------------------------------------------------
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "Myinstance2" {
  ami           = "ami-01e24be29428c15b2"
  instance_type = "t2.micro"
  user_data     = "${file("WebServer-userdata.sh")}"
  key_name      = "evmrykhin-oregon"
  vpc_security_group_ids = ["${aws_security_group.MySecurityGroup2.id}"]
  tags {
    Name = "Terraform-Server"
    Owner = "Evgeny Mrykhin"
  }

}

resource "aws_security_group" "MySecurityGroup2" {
  name = "WebServer-UserData-Script"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]
  }


  tags ={
    Name = "SG-for-Terraform"
  }
}

#=======================================
output "public_ip" {
  value = "${aws_instance.Myinstance2.public_ip}"
}
