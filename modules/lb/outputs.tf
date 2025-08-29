output "alb_dns_name" {
  description = "DNS name du Load Balancer"
  value       = aws_lb.ecoshoplb.dns_name
}
