terraform {
  required_version = ">= 0.15.0"
  backend "s3" {
    bucket         = "my-s3-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1" # I chose this region
    dynamodb_table = "my-dynamodb-table"
    encrypt        = true
  }
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Create public subnet in VPC
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

# Create S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "my-s3-bucket" 
  acl    = "private"
}

# Create EC2 Instances
resource "aws_instance" "ec2_instance_1" {
  ami           = "ami-053b0d53c279acc90" # I am using Ubuntu v22 AMI
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
}

resource "aws_instance" "ec2_instance_2" {
  ami           = "ami-053b0d53c279acc90" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
}

# Create EBS Volumes and attach them to EC2 Instances
resource "aws_ebs_volume" "volume_1" {
  availability_zone = "us-east-1a"
  size              = 10
}

resource "aws_ebs_volume" "volume_2" {
  availability_zone = "us-east-1a"
  size              = 10
}

resource "aws_volume_attachment" "attachment_1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_1.id
  instance_id = aws_instance.ec2_instance_1.id
}

resource "aws_volume_attachment" "attachment_2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_2.id
  instance_id = aws_instance.ec2_instance_2.id
}
