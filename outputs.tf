output "env" {
  value = [
    {
      name  = "CLOUDWATCH_LOG_GROUP"
      value = local.log_group_name
    }
  ]
}
