variable "compartment_id" {
  description = "OCID of the compartment in which to create the log group."
  type        = string
}

variable "display_name" {
  description = "Human-readable name for the log group."
  type        = string
}

variable "description" {
  description = "Description of the log group."
  type        = string
  default     = null
}

variable "log" {
  description = "Optional custom log to create inside the group. Null creates only the group."
  type = object({
    display_name       = string
    log_type           = optional(string, "CUSTOM")
    retention_duration = optional(number, 30)
    is_enabled         = optional(bool, true)
  })
  default = null

  validation {
    condition     = var.log == null ? true : contains(["CUSTOM", "SERVICE"], var.log.log_type)
    error_message = "log.log_type must be CUSTOM or SERVICE."
  }
}

variable "freeform_tags" {
  description = "Free-form tags applied to the log group and log."
  type        = map(string)
  default     = {}
}

variable "defined_tags" {
  description = "Defined tags applied to the log group and log, keyed as \"namespace.key\"."
  type        = map(string)
  default     = {}
}
