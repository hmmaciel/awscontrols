variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "SecurityControlsAWS"
}

variable "allowed_ips" {
  description = "Value of the IP allowed for EC2 SSH ingress"
  type        = string
  default     = "0.0.0.0/0"
}

variable "subnet_backend_range" {
  description = "Range of IP adresses in Backend subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "bucket_name" {
  default = "framework-poc-s3-bucket"
}