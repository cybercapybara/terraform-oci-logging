# terraform-oci-logging

Terraform module that manages an [Oracle Cloud Infrastructure](https://www.oracle.com/cloud/)
Logging log group and, optionally, a custom log inside it. Log groups are containers that
organise logs and control their IAM policies.

## Usage

```hcl
module "logging" {
  source = "github.com/cybercapybara/terraform-oci-logging"

  compartment_id = var.compartment_id
  display_name   = "prod-log-group"
  description    = "Production application logs"

  log = {
    display_name       = "app-custom-log"
    log_type           = "CUSTOM"
    retention_duration = 90
  }

  freeform_tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| oci       | >= 5.0   |

## Inputs

| Name             | Description                                                       | Type          | Default | Required |
|------------------|-------------------------------------------------------------------|---------------|---------|:--------:|
| `compartment_id` | OCID of the compartment in which to create the log group.         | `string`      | n/a     |   yes    |
| `display_name`   | Human-readable name for the log group.                            | `string`      | n/a     |   yes    |
| `description`    | Description of the log group.                                     | `string`      | `null`  |    no    |
| `log`            | Optional custom log to create inside the group.                   | `object(...)` | `null`  |    no    |
| `freeform_tags`  | Free-form tags applied to the log group and log.                  | `map(string)` | `{}`    |    no    |
| `defined_tags`   | Defined tags applied to the group and log, keyed `namespace.key`. | `map(string)` | `{}`    |    no    |

## Outputs

| Name                     | Description                                    |
|--------------------------|------------------------------------------------|
| `log_group_id`           | OCID of the log group.                         |
| `log_group_display_name` | Display name of the log group.                 |
| `log_id`                 | OCID of the created log, if requested.         |
| `state`                  | Lifecycle state of the log group.              |

## License

[MIT](LICENSE)
