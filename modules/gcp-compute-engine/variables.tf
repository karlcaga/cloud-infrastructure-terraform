variable "name" {
  description = "Name of GCE instance"
  type        = string
  default     = ""
}

variable "machine_type" {
  description = "Type of Compute Engine machine"
  type        = string
  default     = "e2-micro"
}

variable "zone" {
  description = "The zone that the GCE instance is created"
  type        = string
  default     = "northamerica-northeast2-a"
}

variable "network_tier" {
  description = "Networking tier. Accepted values: 'PREMIUM' and 'STANDARD'"
  type        = string
  default     = "STANDARD"
}

variable "boot_disk_image" {
  description = "The image from which to initialize this disk"
  type        = string
  default     = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20240911"
}

variable "boot_disk_size" {
  description = "The size of the image in gigabytes"
  type        = number
  default     = 5
}

variable "boot_disk_type" {
  description = "The GCE disk type. 'pd-standard', 'pd-balanced' or 'pd-ssd'"
  type        = string
  default     = "pd-balanced"
}

variable "tags" {
  description = "A list of network tags "
  type        = list(string)
  default     = []
}
