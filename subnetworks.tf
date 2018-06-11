resource "aws_security_group" "subnetsecurity" {
  vpc_id = "${aws_vpc.our_development_network.id}"

  ingress = {
    cidr_blocks = [
      "${aws_vpc.our_development_network.cidr_block}",
    ]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block        = "${cidrsubnet(aws_vpc.our_development_network.cidr_block, 3 ,1)}"
  vpc_id            = "${aws_vpc.our_development_network.id}"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet2" {
  # cidr_block = "${cidrsubnet(iprange, newbits, netnum)}"
  cidr_block        = "${cidrsubnet(aws_vpc.our_development_network.cidr_block, 2 ,2)}"
  vpc_id            = "${aws_vpc.our_development_network.id}"
  availability_zone = "us-east-1b"
}
