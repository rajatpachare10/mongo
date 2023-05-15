provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}



resource "aws_instance" "instance1" {
ami = "ami-0af25d0df86db00c1"
instance_type = "t2.micro"
key_name               = "ansible"
monitoring             = true
vpc_security_group_ids = ["sg-01e28f7d770f5f992"]
subnet_id              = "subnet-0aabe6c78b921eb9c"

tags = {
Name = "Mongo-Master"
}
}

resource "aws_instance" "instance2" {
ami = "ami-0af25d0df86db00c1"
instance_type = "t2.micro"
key_name               = "ansible"
monitoring             = true
vpc_security_group_ids = ["sg-01e28f7d770f5f992"]
subnet_id              = "subnet-0aabe6c78b921eb9c"

tags = {
Name = "Mongo-Slave1"
}
}

resource "aws_instance" "instance3" {
ami = "ami-0af25d0df86db00c1"
instance_type = "t2.micro"
key_name               = "ansible"
monitoring             = true
vpc_security_group_ids = ["sg-01e28f7d770f5f992"]
subnet_id              = "subnet-0aabe6c78b921eb9c"

tags = {
Name = "Mongo-Slave2"
}
}


