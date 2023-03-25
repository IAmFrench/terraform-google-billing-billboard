terraform {
  required_version = ">= 1.1.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.58.0"
    }

    http = {
      source  = "hashicorp/http"
      version = ">= 3.2.1"
    }
  }
}
