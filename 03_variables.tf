#### Default variable####

variable "in_ips" {
    default = "10.10.10.2/32"
}

variable "username" {
    type = string
}

variable "elb_name" {
    type = string
}

variable "az_zone" {
    type = list
}

variable "timeout" {
    type = number
}
