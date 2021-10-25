variable "datacenters" {
  description = "A list of datacenters in the region which are eligible for task placement."
  type        = list(string)
  default     = ["dc1"]
}

variable "region" {
  description = "The region where the job should be placed."
  type        = string
  default     = "global"
}

variable "app_count" {
  description = "The number of instances to deploy"
  type        = number
  default     = 3
}

variable "resources" {
  description = "The resource to assign to the application."
  type = object({
    cpu    = number
    memory = number
  })
  default = {
    cpu    = 500,
    memory = 256
  }
}

variable "vault_policies" {
  description = "Vault policies required by all tasks of the Atlantis job."
  type        = list(string)
  default     = [""]
}

variable "vault_change_mode" {
  description = "Vault policy change mode."
  type        = string
  default     = "restart"
}

variable "ui_port" {
  description = "Port that Atlantis UI should be exposed."
  type        = number
  default     = 80
}
