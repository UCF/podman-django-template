resource "aws_db_subnet_group" "development" {
    name = "main"
    subnet_ids = [aws_subnet.private-subnet-1.id, aws-subnet.private-subnet-2.id]
}

resource "aws_db_instance" "development" {
    identifier = "development"
}
