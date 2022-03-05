terraform {
    required_providers {
        docker = {
            source = "kreuzewerker/docker"
            version = "~> 2.16.0"
        }
    }
}

provider "docker" {}