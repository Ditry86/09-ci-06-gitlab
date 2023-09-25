resource "yandex_compute_instance" "test_vm" {
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
      image_id = data.yandex_compute_image.centos7.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.test_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
  }
}
