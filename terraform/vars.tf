variable "zone" {
    default=""
}

locals {
    
    lans = {
        default = ["192.168.10.0/24"]
    }

    instances = { 
        "jenkins-master" = {
            platform = "standard-v2",
            cores = 4,
            memory = 8
        },
        "jenkins-agent" = {
            platform = "standard-v2",
            cores = 4,
            memory = 8
        },
    }
}

output "external_ip_address" {
    value = {for k, v in yandex_compute_instance.test_vm: k => v.network_interface.0.nat_ip_address}
}

#output "local_ip_address" {
#    value = {for k, v in yandex_compute_instance.test_vm: k => v.network_interface.0.ip_address}
#}