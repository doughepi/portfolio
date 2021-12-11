resource "google_dns_managed_zone" "portfolio" {
  name        = "piper-codes"
  dns_name    = "${var.dns_name}."
  description = "Zone for my portfolio."

}

resource "google_dns_record_set" "api" {
  name = google_dns_managed_zone.portfolio.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.portfolio.name

  rrdatas = [google_compute_global_address.portfolio.address]
}