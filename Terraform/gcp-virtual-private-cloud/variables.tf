variable "network_name" {
  description = "The name of the VPC network."
  type        = string
  default     = "gke-network1"
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
  default     = "gke-subnet1"
}

variable "subnet_ip_range" {
  description = "The IP address range of the subnet in CIDR format."
  type        = string
  default     = "10.0.0.0/24"
}