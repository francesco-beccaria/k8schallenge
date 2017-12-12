resource "azurerm_network_interface" "ws_nic" {
  count         = "${var.ws_instances}"
  name 			= "ws-nic-00${count.index + 1}"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_ws.id}"

  ip_configuration {
    name 			= "ws-ip-private"
    subnet_id 			= "${azurerm_subnet.prt_sub.id}"
    private_ip_address_allocation = "dynamic"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.wsip.id}"]
#    private_ip_address = "192.168.2.5"
#    public_ip_address_id        = "${azurerm_public_ip.la_db_pip.id}"
  }
}

resource "azurerm_network_interface" "sync_nic" {
  count         = "${var.sync_instance}"
  name 			= "sync-nic-00${count.index + 1}"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_sync.id}"

  ip_configuration {
    name 			= "sync-ip-private"
    subnet_id 			= "${azurerm_subnet.prt_sub.id}"
    private_ip_address_allocation = "dynamic"
#    private_ip_address = "192.168.2.5"
#    public_ip_address_id        = "${azurerm_public_ip.la_db_pip.id}"
  }
}

resource "azurerm_network_interface" "tm_nic" {
  count         = "${var.tm_instances}"
  name 			= "tm-nic-00${count.index + 1}"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_tm.id}"

  ip_configuration {
    name 			= "tm-ip-private"
    subnet_id 			= "${azurerm_subnet.prt_sub.id}"
    private_ip_address_allocation = "dynamic"
#    private_ip_address = "192.168.2.5"
#    public_ip_address_id        = "${azurerm_public_ip.la_db_pip.id}"
  }
}

resource "azurerm_network_interface" "wsw_nic" {
  count         = "${var.wsw_instance}"
  name 			= "wsw-nic-00${count.index + 1}"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg_wsw.id}"

  ip_configuration {
    name 			= "wsw-ip-private"
    subnet_id 			= "${azurerm_subnet.prt_sub.id}"
    private_ip_address_allocation = "dynamic"
#    private_ip_address = "192.168.2.5"
#    public_ip_address_id        = "${azurerm_public_ip.la_db_pip.id}"
  }
}