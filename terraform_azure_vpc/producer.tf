resource "azurerm_virtual_machine" "pr_web" {
  count                 = "${var.ws_instances}"
  name                  = "USEastprweb00${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.producer.name}"
  network_interface_ids = ["${element(azurerm_network_interface.ws_nic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  availability_set_id   = "${azurerm_availability_set.pr_web.id}"

#This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
#    count         = "${var.ws_instances}"
    name          = "osdisk-web-0${count.index+1}"
    vhd_uri       = "${azurerm_storage_account.pr_storage.primary_blob_endpoint}${azurerm_storage_container.pr_cont.name}/osdisk-web-0${count.index+1}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "pr-web-00${count.index+1}"
    admin_username = "${var.vm_username}"
#    admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = ["${var.ssh_key}"]
  }
}

resource "azurerm_virtual_machine" "pr_tm" {
  count                 = "${var.tm_instances}"
  name                  = "USEastprtm00${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.producer.name}"
  network_interface_ids = ["${element(azurerm_network_interface.tm_nic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  availability_set_id   = "${azurerm_availability_set.pr_tm.id}"

#This will delete the OS disk and data disk automatically when deleting the VM
  delete_os_disk_on_termination = true
  #delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-tm-0${count.index+1}"
    vhd_uri       = "${azurerm_storage_account.pr_storage.primary_blob_endpoint}${azurerm_storage_container.pr_cont.name}/osdisk-tm-0${count.index+1}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "pr-tm-00${count.index+1}"
    admin_username = "${var.vm_username}"
#    admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = ["${var.ssh_key}"]
  }
}

resource "azurerm_virtual_machine" "pr_sync" {
  count                 = "${var.sync_instance}"
  name                  = "USEastprsync00${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.producer.name}"
  network_interface_ids = ["${element(azurerm_network_interface.sync_nic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  availability_set_id   = "${azurerm_availability_set.pr_sync.id}"

#This will delete the OS disk and data disk automatically when deleting the VM
  delete_os_disk_on_termination = true
  #delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-sync-0${count.index+1}"
    vhd_uri       = "${azurerm_storage_account.pr_storage.primary_blob_endpoint}${azurerm_storage_container.pr_cont.name}/osdisk-sync-0${count.index+1}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "pr-sync-00${count.index+1}"
    admin_username = "${var.vm_username}"
#    admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = ["${var.ssh_key}"]
  }
}

resource "azurerm_virtual_machine" "pr_wsw" {
  count                 = "${var.wsw_instance}"
  name                  = "USEastprwsw00${count.index+1}"
  location              = "${var.location}"
  resource_group_name   = "${azurerm_resource_group.producer.name}"
  network_interface_ids = ["${element(azurerm_network_interface.wsw_nic.*.id, count.index)}"]
  vm_size               = "${var.vm_size}"
  availability_set_id   = "${azurerm_availability_set.pr_wsw.id}"

#This will delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "ubuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name          = "osdisk-wsw-0${count.index+1}"
    vhd_uri       = "${azurerm_storage_account.pr_storage.primary_blob_endpoint}${azurerm_storage_container.pr_cont.name}/osdisk-wsw-0${count.index+1}.vhd"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "pr-web-00${count.index+1}"
    admin_username = "${var.vm_username}"
#    admin_password = "${var.vm_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys = ["${var.ssh_key}"]
  }
}