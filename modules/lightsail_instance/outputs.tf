# output.tf

# output "lightsail_instance_id" {
#   description = "ID of the Lightsail instance"
#   value       = aws_lightsail_instance.lightsail_instance.id
# }

# output "lightsail_instance_public_ip" {
#   description = "Public IP address of the Lightsail instance"
#   value       = aws_lightsail_instance.lightsail_instance.public_ip_address
# }

# output "static_ip_id" {
#   description = "ID of the Lightsail static IP"
#   value       = aws_lightsail_static_ip.static_ip[*].id
# }

# output "static_ip_address" {
#   description = "Public IP address of the Lightsail static IP"
#   value       = aws_lightsail_static_ip.static_ip[*].ip_address
# }


output "lightsail_instance_name" {
  description = "Name of the Lightsail instance"
  value       = var.instance_name
}

output "lightsail_bundle_id" {
  description = "ID of the Lightsail instance bundle"
  value       = var.bundle_id
}

output "lightsail_blueprint_id" {
  description = "ID of the Lightsail instance blueprint"
  value       = var.blueprint_id
}

# output "lightsail_key_pair_name" {
#   description = "Name of the Lightsail key pair"
#   value       = var.key_pair_name
# }

output "lightsail_associate_elastic_ip" {
  description = "Whether to associate an Elastic IP with the instance"
  value       = var.associate_elastic_ip
}