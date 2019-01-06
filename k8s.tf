#variable "do_token" {}
#variable "pub_key" {}
#variable "pvt_key" {}
#variable "ssh_fingerprint" {}

provider "digitalocean" {
 # token         = "${var.do_token}"
}

resource "digitalocean_tag" "do-k8s-master" {
    name = "do-k8s-master"
}
resource "digitalocean_droplet" "k8s-master" {
    image                   = "ubuntu-16-04-x64"
    name                    = "k8s-master-${count.index}"
    region                  = "${var.do_region}"
    size                    = "${var.do_size}"
    private_networking      = true
    count                   = "${var.do_master_count}"
    tags                    = ["${digitalocean_tag.do-k8s-master.name}"]
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
 }

 resource "digitalocean_tag" "do-k8s-worker" {
    name = "do-k8s-worker"
}

resource "digitalocean_droplet" "k8s-worker" {
    image                   = "ubuntu-16-04-x64"
    name                    = "k8s-worker-${count.index}"
    region                  = "${var.do_region}"
    size                    = "${var.do_size}"
    private_networking      = true
    count                   = "${var.do_worker_count}"
    tags                    = ["${digitalocean_tag.do-k8s-worker.name}"]
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
 }

output "Master Public_ips" {
  value = ["${digitalocean_droplet.k8s-master.*.ipv4_address}"]
}

output "Worker Public_ips" {
  value = ["${digitalocean_droplet.k8s-worker.*.ipv4_address}"]
}
