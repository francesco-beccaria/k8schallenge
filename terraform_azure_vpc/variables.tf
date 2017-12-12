# Setting Azure default value
variable "az_sub_id" {
  default = "replacemewithsomethingmeaningful"
}
# application ID
variable "az_cli_id" {
  default = "replacemewithsomethingmeaningful"
}
# secret part ok the generated key
variable "az_cli_scrt" {
  default = "replacemewithsomethingmeaningful"
}
# directory ID
variable "az_tenant_id" {
  default = "replacemewithsomethingmeaningful"
}
# deployment details
variable "location" {
  default = "East US"
}
variable "network_range" {
  default = "10.0.0.0/16"
}
# instance definition
variable "vm_username" {
  default = "az_admin"
}
variable "vm_size" {
  default = "Standard_DS1_v2"
}
variable "ws_instances" {
  default = 2
}
variable "tm_instances" {
  default = 1
}
variable "sync_instance" {
  default = 1
}
variable "wsw_instance" {
  default = 0
}
variable "ssh_key" {
  type = "list"
  default = [
    {
      path = "/home/az_admin/.ssh/authorized_keys"
      key_data = "replacemewithsomethingmeaningful"
    }]
}
