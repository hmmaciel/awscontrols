resource "aws_route53_record" "www" {
  zone_id = "Z0642644RYY4VJSV5F2F"
  name    = "iam.cfappsecurity.com"
  type    = "A"

  alias {
    name                   = aws_lb.alb.dns_name
    zone_id                = aws_lb.alb.zone_id
    evaluate_target_health = true
  }
}