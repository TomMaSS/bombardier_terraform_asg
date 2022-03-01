variable "target" {
  type = string
  description = "target"
}

variable "connections" {
  default = 1000
}

variable "live_seconds" {
  default = 3600
}

variable "ami" {
  type = string
  description = "ami version"
}

variable "aws_subnets" {
    type = list(string)
}

variable "desired_capacity" {
  type = string
  default = "1"
}

variable "max_size" {
  type = string
  default = "1"
}

variable "min_size" {
  type = string
  default = "1"
}

variable "key_name" {
  type = string
  description = "ssh key pair"
}

variable "vpc_security_group_ids" {
  type = list  
}

variable "force_delete" {
  default     = true
  description = "(Optional) Allows deleting the Auto Scaling Group without waiting for all instances in the pool to terminate. You can force an Auto Scaling Group to delete even if it's in the process of scaling a resource. Normally, Terraform drains all the instances before deleting the group. This bypasses that behavior and potentially leaves resources dangling."
}

variable "scale_down_threshold" {
  description = "Autoscale cpu utilization threshold for scale down"
  default     = "15.0"
}

variable "name_prefix" {
  default = "worker"
}
