output "ws_name" {
  value = ["${azurerm_virtual_machine.pr_web.*.name}"]
}
output "ws_ip" {
  value = ["${azurerm_network_interface.ws_nic.*.private_ip_address}"]
}
output "tm_name" {
  value = ["${azurerm_virtual_machine.pr_tm.*.name}"]
}
output "tm_ip" {
  value = ["${azurerm_network_interface.tm_nic.*.private_ip_address}"]
}
output "sync_name" {
  value = ["${azurerm_virtual_machine.pr_sync.*.name}"]
}
output "sync_ip" {
  value = ["${azurerm_network_interface.sync_nic.*.private_ip_address}"]
}
output "lb_ip" {
  value = ["${azurerm_public_ip.lbip.ip_address}"]
}
output "storage_name" {
  value = ["${azurerm_storage_account.pr_storage.id}"]
}
output "db_name" {
  value = ["${azurerm_postgresql_database.etms.server_name}"]
}