resource "azurerm_network_security_group" "nsg_db" {
  name 			= "tf-db-nsg"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"

  security_rule {
	name 			= "AllowSSH"
	priority 		= 100
	direction 		= "Inbound"
	access 		        = "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "22"
    source_address_prefix      	= "10.0.2.0/24"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 			= "AllowHTTP"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "5432"
    source_address_prefix      	= "10.0.1.0/24"
    destination_address_prefix 	= "*"
  }
}

resource "azurerm_network_security_group" "nsg_ws" {
  name 			= "tf-ws-nsg"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"

  security_rule {
	name 			= "AllowInternet"
	priority 		= 100
	direction 		= "Outbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "*"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "Internet"
  }

  security_rule {
	name 			= "AllowCelery"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "8080"
    source_address_prefix      	= "AzureLoadBalancer"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 			= "AllowSSH"
	priority 		= 300
	direction 		= "Inbound"
	access 		        = "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "22"
    source_address_prefix      	= "10.0.2.0/24"
    destination_address_prefix 	= "*"
  }
}

resource "azurerm_network_security_group" "nsg_tm" {
  name 			= "tf-tm-nsg"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"

  security_rule {
	name 			= "AllowInternet"
	priority 		= 100
	direction 		= "Outbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "*"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "Internet"
  }

  security_rule {
	name 			= "AllowTasks"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "9000"
    source_address_prefix      	= "10.0.2.0/24"
    destination_address_prefix 	= "*"
  }
}

resource "azurerm_network_security_group" "nsg_sync" {
  name 			= "tf-sync-nsg"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"

  security_rule {
	name 			= "AllowInternet"
	priority 		= 100
	direction 		= "Outbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "*"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "Internet"
  }

  security_rule {
	name 			= "AllowSites"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "9000"
    source_address_prefix      	= "10.0.2.0/24"
    destination_address_prefix 	= "*"
  }

  security_rule {
	name 			= "AllowMon"
	priority		= 300
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "8091"
    source_address_prefix      	= "10.0.1.0/24"
    destination_address_prefix 	= "*"
  }
}

resource "azurerm_network_security_group" "nsg_wsw" {
  name 			= "tf-wsw-nsg"
  location 		= "${var.location}"
  resource_group_name 	= "${azurerm_resource_group.producer.name}"

  security_rule {
	name 			= "BlockInternet"
	priority 		= 100
	direction 		= "Outbound"
	access 			= "Deny"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "*"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "Internet"
  }

  security_rule {
	name 			= "AllowWSW"
	priority		= 200
	direction		= "Inbound"
	access 			= "Allow"
	protocol 		= "Tcp"
	source_port_range       = "*"
    destination_port_range     	= "8081"
    source_address_prefix      	= "*"
    destination_address_prefix 	= "Internet"
  }
}