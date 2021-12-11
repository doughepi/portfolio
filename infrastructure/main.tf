resource "google_cloud_run_service" "api" {
  name     = "api"
  location = "us-central1"
  project  = var.project_id
  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${var.project_id}/general/${var.image_name}:${var.image_tag}"
      }
    }
  }
}

data "google_iam_policy" "api" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "api" {
  location = google_cloud_run_service.api.location
  project  = google_cloud_run_service.api.project
  service  = google_cloud_run_service.api.name

  policy_data = data.google_iam_policy.api.policy_data
}

resource "google_compute_global_address" "api" {
  name    = "api"
  project = var.project_id
}

resource "google_compute_managed_ssl_certificate" "api" {
  name    = "api"
  project = var.project_id
  managed {
    domains = [var.dns_name]
  }

  depends_on = [
    google_dns_record_set.api
  ]
}


resource "google_compute_region_network_endpoint_group" "api" {
  name                  = "api"
  project               = var.project_id
  network_endpoint_type = "SERVERLESS"
  region                = "us-central1"
  cloud_run {
    service = google_cloud_run_service.api.name
  }
}

resource "google_compute_backend_service" "api" {
  name        = "api"
  project     = var.project_id
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 30
  enable_cdn  = true
  cdn_policy {
    cache_mode                   = "CACHE_ALL_STATIC"
    default_ttl                  = 3600
    client_ttl                   = 7200
    max_ttl                      = 10800
    negative_caching             = true
    signed_url_cache_max_age_sec = 7200
  }

  backend {
    group = google_compute_region_network_endpoint_group.api.id
  }
}

resource "google_compute_url_map" "api" {
  name            = "api"
  project         = var.project_id
  default_service = google_compute_backend_service.api.id
}

resource "google_compute_target_https_proxy" "api" {
  name    = "api"
  project = var.project_id
  url_map = google_compute_url_map.api.id
  ssl_certificates = [
    google_compute_managed_ssl_certificate.api.id
  ]
}

resource "google_compute_global_forwarding_rule" "api" {
  name       = "api"
  project    = var.project_id
  target     = google_compute_target_https_proxy.api.id
  port_range = "443"
  ip_address = google_compute_global_address.api.address
}
