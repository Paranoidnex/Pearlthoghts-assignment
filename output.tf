output "public_ip" {
  value = aws_instance.PT_Assignment_ec2.public_ip
}

output "strapi_url" {
  value = "http://${aws_instance.PT_Assignment_ec2.public_ip}:1337"
}