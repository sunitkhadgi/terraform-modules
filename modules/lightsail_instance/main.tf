
resource "aws_lightsail_instance" "lightsail_instance" {
  name           = "${var.instance_name}-${var.env}"
  bundle_id      = var.bundle_id
  blueprint_id   = var.blueprint_id
  availability_zone  = var.availability_zone
  tags = var.instance_tags

}

resource "aws_lightsail_static_ip" "static_ip" {
  count = var.associate_elastic_ip ? 1 : 0
  name  = "${var.instance_name}-static-ip"
}

resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  count          = var.associate_elastic_ip ? 1 : 0
  instance_name  = aws_lightsail_instance.lightsail_instance.name
  static_ip_name = aws_lightsail_static_ip.static_ip[0].name
}


# resource "aws_security_group" "lightsail_security_group" {

# count          = var.sg_create ? 1 : 0
#   name        = "${var.sg_name}-${var.env}"

#   dynamic "ingress" {
#     for_each = var.ingress_rules
#     content {
#       from_port   = ingress.value.from_port
#       to_port     = ingress.value.to_port
#       protocol    = ingress.value.protocol
#       cidr_blocks = ingress.value.cidr_blocks
#     }
#   }
# }

# resource "aws_network_interface_sg_attachment" "sg_attachment" {
#   security_group_id    = aws_security_group.lightsail_security_group.id
#   network_interface_id = aws_lightsail_instance.lightsail_instance.primary_network_interface_id
# }