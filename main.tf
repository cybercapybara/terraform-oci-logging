resource "oci_logging_log_group" "this" {
  compartment_id = var.compartment_id
  display_name   = var.display_name
  description    = var.description

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}

resource "oci_logging_log" "this" {
  count = var.log != null ? 1 : 0

  log_group_id       = oci_logging_log_group.this.id
  display_name       = var.log.display_name
  log_type           = var.log.log_type
  retention_duration = var.log.retention_duration
  is_enabled         = var.log.is_enabled

  freeform_tags = var.freeform_tags
  defined_tags  = var.defined_tags
}
