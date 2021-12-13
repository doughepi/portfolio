resource "google_storage_bucket" "portfolio" {
  name          = var.deploy_bucket
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_iam_member" "portfolio" {
  bucket = google_storage_bucket.portfolio.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_compute_global_address" "portfolio" {
  name    = "portfolio"
  project = var.project_id
}

resource "google_compute_managed_ssl_certificate" "portfolio" {
  name    = "portfolio"
  project = var.project_id
  managed {
    domains = [var.dns_name]
  }

  depends_on = [
    google_dns_record_set.portfolio
  ]
}


resource "google_compute_backend_bucket" "portfolio" {
  name        = "portfolio"
  description = "Static portfolio content."
  bucket_name = google_storage_bucket.portfolio.name
  enable_cdn  = true
  cdn_policy {
    cache_mode                   = "CACHE_ALL_STATIC"
    default_ttl                  = 3600
    client_ttl                   = 7200
    max_ttl                      = 10800
    negative_caching             = true
    signed_url_cache_max_age_sec = 7200
  }
}

resource "google_compute_url_map" "portfolio" {
  name            = "portfolio"
  project         = var.project_id
  default_service = google_compute_backend_bucket.portfolio.self_link
}

resource "google_compute_target_https_proxy" "portfolio" {
  name    = "portfolio"
  project = var.project_id
  url_map = google_compute_url_map.portfolio.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.portfolio.id
  ]
}

resource "google_compute_global_forwarding_rule" "portfolio" {
  name       = "portfolio"
  project    = var.project_id
  target     = google_compute_target_https_proxy.portfolio.id
  port_range = "443"
  ip_address = google_compute_global_address.portfolio.address
}
