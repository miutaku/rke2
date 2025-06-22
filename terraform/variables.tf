variable "vm_count" {
    description = "The number of virtual machines"
    type        = number
    default     = 2
}

variable "base_rke2_macaddr" {
    description = "The base MAC address of the virtual machines"
    type        = string
    default     = "BC:24:11:23:32:00"
}

#variable "tuner_vm_name" {
#    description = "The name of the mirakurun virtual machine"
#    type        = string
#    default     = "mirakurun-ubuntu-24-04-home-amd64"
#}