variable "region" {
  default = "us-east-1"
  type    = string
}

variable "profile" {
  default = "default"
  type    = string
}

/*variable "ami" {
  default = "ami-0715c1897453cabd1"
  type = string
}*/

variable "web-count" {
  type    = number
  default = 2
}
variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "resource_name" {
  type    = list(string)
  default = ["WebServer", "TransactionServer", "AdapterServer"]
}

variable "deployment_type" {
  type    = string
  default = "dev"
}

variable "ingress_ports" {
  type        = list(number)
  default     = ["443", "8200", "8101", "9200"]
  description = "For Front-End acceptance"
}