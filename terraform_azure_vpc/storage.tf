resource "azurerm_storage_account" "pr_storage" {
  name 			= "aamprstorage"
  resource_group_name 	= "${azurerm_resource_group.producer.name }"
  location 		= "${var.location}"
  account_tier 		= "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "pr_cont" {
  name 			= "vhds"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"
  storage_account_name 	= "${azurerm_storage_account.pr_storage.name}"
  container_access_type = "private"
}