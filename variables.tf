variable "region" {
  default = "ap-south-1"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "ami" {
  default = "ami-0f5ee92e2d63afc18"
}

variable "key_name" {
  default = "PT_ASSIGNMENT_KEY"
}

variable "security_group_name" {
  default = "PT_ASSIGNMENT_SG"
}

variable "public_key_path" {
  default = "PT_ASSIGNMENT_KEY.pub"
}
