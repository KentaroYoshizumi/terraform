resource "aws_instance" "hello-world" {
    ami = "ami-0218d08a1f9dac831"
    key_name      = "aws-terraform"
    instance_type = "t2.micro"

    subnet_id              = aws_subnet.public-a.id
    vpc_security_group_ids = ["${aws_security_group.allow.id}"]

    tags = {
        Name = "HelloWorld"
    }

}
