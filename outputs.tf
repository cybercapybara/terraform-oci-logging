output "log_group_id" {
  description = "OCID of the log group."
  value       = oci_logging_log_group.this.id
}

output "log_group_display_name" {
  description = "Display name of the log group."
  value       = oci_logging_log_group.this.display_name
}

output "log_id" {
  description = "OCID of the created log, if one was requested."
  value       = try(oci_logging_log.this[0].id, null)
}

output "state" {
  description = "Lifecycle state of the log group."
  value       = oci_logging_log_group.this.state
}
