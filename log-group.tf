data "ns_connection" "log-group" {
  name     = "log-group"
  contract = "datastore/aws/cloudwatch"
}

locals {
  log_group_name = data.ns_connection.log-group.outputs.log_group_name
  log_group_arn  = data.ns_connection.log-group.outputs.log_group_arn
}
