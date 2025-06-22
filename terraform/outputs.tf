output "vm_names" {
  value = [for rke2_worker in proxmox_vm_qemu.rke2_worker : rke2_worker.name]
}
output "vm_ids" {
  value = [for rke2_worker in proxmox_vm_qemu.rke2_worker : rke2_worker.id]
}

output "container_vm_name" {
  value = proxmox_vm_qemu.container.name
}
output "container_vm_id" {
  value = proxmox_vm_qemu.container.id
}

output "tuner_vm_name" {
  value = proxmox_vm_qemu.tuner.name
}
output "tuner_vm_id" {
  value = proxmox_vm_qemu.tuner.id
}
