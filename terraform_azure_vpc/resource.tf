# Create a resource group
resource "azurerm_resource_group" "producer" {
  name     = "production"
  location = "${var.location}"
}

# Create a virtual network in the web_servers resource group
resource "azurerm_virtual_network" "network" {
  name = "productionNetwork"
  address_space = [
    "${var.network_range}"]
  location = "${var.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"
}

resource "azurerm_subnet"  "pub_sub" {
    name = "public_subnet"
    address_prefix = "10.0.1.0/24"
    virtual_network_name 	= "${azurerm_virtual_network.network.name}"
    resource_group_name 	= "${azurerm_resource_group.producer.name}"
}

resource "azurerm_subnet"  "prt_sub" {
    name = "private_subnet"
    address_prefix = "10.0.2.0/24"
    virtual_network_name 	= "${azurerm_virtual_network.network.name}"
    resource_group_name 	= "${azurerm_resource_group.producer.name}"
}

resource "azurerm_availability_set" "pr_web" {
  name                = "AvailabilitySetProducerWeb"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  tags {
    environment = "Producer Web server set"
  }
}

resource "azurerm_availability_set" "pr_tm" {
  name                = "AvailabilitySetProducerTm"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  tags {
    environment = "Producer Task Manager server set"
  }
}

resource "azurerm_availability_set" "pr_wsw" {
  name                = "AvailabilitySetProducerWsw"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  tags {
    environment = "Producer Websockets server set"
  }
}

resource "azurerm_availability_set" "pr_sync" {
  name                = "AvailabilitySetProducerSync"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  tags {
    environment = "Producer Sync server set"
  }
}