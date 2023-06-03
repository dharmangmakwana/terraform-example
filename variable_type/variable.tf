variable "region" {
    default = "us-east-1"
    type = string
}

variable "profile" {
    default = "default"
    type = string
}

variable "home_ip" {
  default = "18.213.236.190/32"
  type = string
}

variable "ami" {
  default = "ami-0715c1897453cabd1"
  type = string
}


variable "instance_type" {
  default = "t2.micro"
  type = string
}

variable "az" {
  type = list(string)
}

variable "json" {
  type = map(string)
  default = {
    fathername = "dharmang"
    daughtername = "rishika"
    sonname = "riaan"
    wife = "saloni"
  }

}