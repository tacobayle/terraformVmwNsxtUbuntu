resource "nsxt_vm_tags" "vm1_tags" {
  instance_id = vsphere_virtual_machine.ubuntu.id
  tag {
    tag   = var.ubuntu.nsxt_vm_tags
  }
}
