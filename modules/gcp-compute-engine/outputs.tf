output "public_ip" {
  description = "External IP address of the instance"
  value       = google_compute_instance.this.network_interface[0].access_config[0].nat_ip
}

output "name" {
  description = "The name of the GCE instance"
  value       = google_compute_instance.this.name
}