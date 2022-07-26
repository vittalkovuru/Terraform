variable "secret_name" {
  description = "KV secret name"
  default     = "default-secret-name"
  type        = string
}

variable "secret_names" {
  description = "KV secret names - list"
  type        = map(string)
}

variable "secret_value" {
  description = "KV secret value"
  default     = "default-secret-value"
  type        = string
}

variable "key_vault_id" {
  description = "Default application name in short form."
  default     = "kv_id"
  type        = string
}

