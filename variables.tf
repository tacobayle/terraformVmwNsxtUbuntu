#
### VMware variables
#
variable "vsphere_user" {}
variable "vsphere_password" {}
variable "vsphere_server" {}
#
#
variable "dc" {
default     = "N1-DC"
}
#
variable "cluster" {
default     = "N1-Cluster1"
}
#
variable "datastore" {
default     = "vsanDatastore"
}
#
variable "network" {
default     = "N1-T1_Segment-Backend_10.7.6.0-24"
}
#
variable "resource_pool" {
default     = "N1-Cluster1/Resources"
}
#
variable "wait_for_guest_net_timeout" {
  default = "5"
}

variable "contentLibrary" {
  default = {
    name = "Content Library Build new web server"
    description = "Content Library Build new web server"
    files = ["/home/christoph/Downloads/bionic-server-cloudimg-amd64.ova"]
  }
}
#
variable "ubuntu" {
  type = map
  default = {
    name = "backend-2"
    cpu = 1
    memory = 2048
    disk = 20
    password = "Avi_2020"
    public_key_path = "~/.ssh/id_rsa/ubuntu-bionic-18.04-cloudimg-template.key.pub"
    private_key_path = "~/.ssh/id_rsa/ubuntu-bionic-18.04-cloudimg-template.key"
    wait_for_guest_net_routable = "false"
    template_name = "ubuntu-bionic-18.04-cloudimg-template"
    ipCidr = "10.7.6.100/24"
    netplanFile = "/etc/netplan/50-cloud-init.yaml"
    defaultGw = "10.7.6.1"
    dnsMain = "172.18.0.15"
    dnsSec = "10.206.8.131"
    nsxt_vm_tags = "n1-avi-backend-servers-01"
  }
}
#
#
# NSX-T Variable
#
variable "nsx_user" {}
variable "nsx_password" {}
variable "nsx_server" {}
