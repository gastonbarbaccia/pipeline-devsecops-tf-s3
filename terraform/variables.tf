variable "aws_region" {
  default = "us-east-1"
}

variable "state_bucket" {
  description = "Bucket donde guardar el terraform state"
}

variable "db_password" {
  sensitive = true
}
