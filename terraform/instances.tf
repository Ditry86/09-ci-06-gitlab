resource "yandex_compute_instance" "gitlab" {
  for_each = local.instances
  name = "${each.key}-01"
  platform_id = each.value.platform
  zone=var.zone
  resources {
    cores  = each.value.cores
    memory = each.value.memory
  }

  boot_disk {
    initialize_params {
      image_id = each.value.image
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test_subnet.id
    nat       = true
  }

  metadata = {
    user-data = "${file("cloudconfig.yml")}"
  }
}
