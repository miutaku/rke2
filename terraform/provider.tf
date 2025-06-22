terraform {
    required_providers {
        proxmox = {
            source = "telmate/proxmox"
            version = "3.0.2-rc01"
        }
    }
}
provider "proxmox" {
  pm_api_url = "https://192.168.0.119:8006/api2/json"
  pm_api_token_id = "PM_API_TOKEN_ID" # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs#creating-the-connection-via-username-and-api-token
  pm_api_token_secret = "PM_API_TOKEN_SECRET" # https://registry.terraform.io/providers/Telmate/proxmox/latest/docs#creating-the-connection-via-username-and-api-token
  pm_tls_insecure = true # default Proxmox Virtual Environment uses self-signed certificates.
}
