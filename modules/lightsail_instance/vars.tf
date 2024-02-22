
variable "instance_name" {
  description = "Name of the Lightsail instance"
}

variable "bundle_id" {
  description = "ID of the Lightsail instance bundle"
}

variable "blueprint_id" {
  description = "ID of the Lightsail instance blueprint"
}

variable "availability_zone" {
  description = "Name of the Lightsail key pair"
}

variable "associate_elastic_ip" {
  description = "Whether to associate an Elastic IP with the instance"
  default     = false
}

variable "env" {
  description = "Name of the Lightsail key pair"
}

variable "instance_tags" {
  description = "Tags for the Lightsail instance"
  type        = map(string)
  default     = {}
}

variable "instance_security_group" {
  default     = {}
  description = "A list of objects representing Lightsail instances with their respective security group configurations."
  type        = map(string)


}

# variable "sg_name" {
#   description = "The name of the Lightsail security group."

# }

# variable "sg_create" {
#   description = "The name of the Lightsail security group."
#   default     = false
# }

# variable "ingress_rules" {
#   description = "A list of ingress rules for the security group."
#   type        = list(object({
#     protocol        = string
#     from_port       = number
#     to_port         = number
#     cidr_blocks     = list(string)
#   }))
# }
