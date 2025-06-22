terraform {
    backend "remote" {
        organization = "miutaku-tf-cloud"
        workspaces {
            name = "miutaku-IaC"
        }
    }
}