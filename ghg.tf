provider "aws" {
  region  = "ap-south-1"
  profile = "task"
}

resource "tls_private_key" "k1"{
  algorithm = "RSA"
}
resource "aws_key_pair" "mykey"{
  key_name   = "mykey"
  public_key = "${tls_private_key.k1.public_key_openssh}"
}

resource "local_file" "key-file"{
  content = "${tls_private_key.k1.private_key_pem}"
  filename = "mykey.pem"
}