provider "oci" {}

module "logging" {
  source = "../.."

  compartment_id = var.compartment_id
  display_name   = "example-log-group"
  description    = "Application log group"

  log = {
    display_name = "app-custom-log"
    log_type     = "CUSTOM"
  }

  freeform_tags = {
    Environment = "sandbox"
    ManagedBy   = "terraform"
  }
}

variable "compartment_id" {
  description = "Compartment OCID to deploy the example log group into."
  type        = string
}

output "log_group_id" {
  value = module.logging.log_group_id
}
