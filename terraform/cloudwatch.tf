resource "aws_cloudwatch_log_group" "cloudtrail" {
  name              = "cloudtrail-log-group"
  retention_in_days = 3
  # ... potentially other configuration ...
}