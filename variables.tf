variable "gcp_credentials" {
  description = "Base64-encoded service account JSON"
  type        = string
  sensitive   = true
}

variable "project" {}
variable "region" {
  default = "us-central1-a"
}
variable "zone" {
  default = "us-central1-a"
}
