variable "region" {
  type        = string
  default     = "" #ex. us-east-1
		}

variable "subnet_cidr_block" {
  type        = string
  default     = "" #ex. 10.10.0.0/24
		}

variable "route_table_cidr_block" {
  type        = string
  default     = "" #ex. 0.0.0.0/0
                }

variable "key_name" {
  type        = string
  default     = "" #ex. linuxkey
                }

variable "instance_type" {
  type        = string
  default     = ""
                }

variable "vpc_security_group_ids" {
  type        = list
  default     = ["sg-0b0503ebc0e28010f"]
                }
