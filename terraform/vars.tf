variable "zone" {
    default=""
}

locals {
    
    lans = {
        default = ["192.168.10.0/24"]

    }

    instances = { 
        "gitlab-server" = {
            platform = "standard-v2",
            cores = 4,
            memory = 8
            image = "fd8oucicohob7630mfkf"
        },
        "gitlab-runner" = {
            platform = "standard-v2",
            cores = 2,
            memory = 4
            image = "fd8i7cedkd0qs6a6ksel"
        },
    }
}

output "external_ip_address" {
    value = {for k, v in yandex_compute_instance.gitlab: k => v.network_interface.0.nat_ip_address}
}

output "local_ip_address" {
    value = {for k, v in yandex_compute_instance.gitlab: k => v.network_interface.0.ip_address}
}