

data "template_file" "ubuntu_userdata" {
  template = file("${path.module}/userdata/ubuntu.userdata")
  vars = {
    password      = var.ubuntu.password
    pubkey        = file(var.ubuntu.public_key_path)
    ipCidr = var.ubuntu.ipCidr
    ip = split("/", var.ubuntu.ipCidr)[0]
    defaultGw = var.ubuntu.defaultGw
    dnsMain = var.ubuntu.dnsMain
    dnsSec = var.ubuntu.dnsSec
    netplanFile = var.ubuntu.netplanFile
  }
}

resource "vsphere_virtual_machine" "ubuntu" {
  name             = var.ubuntu.name
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  network_interface {
                      network_id = data.vsphere_network.network.id
  }

  num_cpus = var.ubuntu.cpu
  memory = var.ubuntu.memory
  wait_for_guest_net_routable = var.ubuntu.wait_for_guest_net_routable
  guest_id = "guestid-${var.ubuntu.name}"

  disk {
    size             = var.ubuntu.disk
    label            = "${var.ubuntu.name}.lab_vmdk"
    thin_provisioned = true
  }

  cdrom {
    client_device = true
  }

  clone {
    template_uuid = vsphere_content_library_item.files[0].id
  }

  vapp {
    properties = {
     hostname    = var.ubuntu.name
     password    = var.ubuntu.password
     public-keys = file(var.ubuntu.public_key_path)
     user-data   = base64encode(data.template_file.ubuntu_userdata.rendered)
   }
 }

  connection {
   host        = split("/", var.ubuntu.ipCidr)[0]
   type        = "ssh"
   agent       = false
   user        = "ubuntu"
   private_key = file(var.ubuntu.private_key_path)
  }

  provisioner "remote-exec" {
   inline      = [
     "while [ ! -f /tmp/cloudInitDone.log ]; do sleep 1; done"
   ]
  }


}
