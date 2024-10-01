terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

variable "region" {
  type    = string
  default = "NORTHAMERICA-NORTHEAST2"
}

provider "google" {
  project = "poised-bot-273002"
}

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

module "pplox-web-deployment" {
  source = "../modules/gcp-compute-engine"

  name = "pplox-web-deployment"
  tags = ["tf", "dev"]
}

# Bucket
resource "random_id" "default" {
  byte_length = 8
}

resource "google_storage_bucket" "tf_state" {
  name     = "${random_id.default.hex}-terraform-remote-backend"
  location = var.region

  force_destroy               = false
  public_access_prevention    = "enforced"
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

resource "local_file" "tf_state" {
  file_permission = "0644"
  filename        = "${path.module}/backend.tf"

  # You can store the template in a file and use the templatefile function for
  # more modularity, if you prefer, instead of storing the template inline as
  # we do here.
  content = <<-EOT
  terraform {
    backend "gcs" {
      bucket = "${google_storage_bucket.tf_state.name}"
    }
  }
  EOT
}
