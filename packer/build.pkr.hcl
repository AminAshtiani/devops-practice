packer {
  required_plugins {
    vagrant = {
      version = "~> 1"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

source "vagrant" "ubuntu" {
  communicator = "ssh"
  source_path = "bento/ubuntu-22.04"
  provider = "virtualbox"
}

source "vagrant" "debian" {
  communicator = "ssh"
  source_path = "bento/debian-12"
  provider = "virtualbox"
}

build {
  sources = [
    "source.vagrant.ubuntu",
    "source.vagrant.debian",
  ]

  provisioner "shell" {
    inline = ["echo hello world"]
  }
}