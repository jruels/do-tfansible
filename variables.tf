##General vars
variable "ssh_user" {
  default = "ubuntu"
}
variable "do_region" {
    default = "lon1"
}
variable "do_master_count" {
    default = 1
}
variable "do_worker_count" {
    default = 2
}
variable "do_size" {
  default = "s-3vcpu-1gb"
}
variable "ssh_fingerprint" {
  default = "8b:92:dc:fb:3f:d7:c0:d0:c5:87:1d:b5:5e:94:c1:a9"
}
