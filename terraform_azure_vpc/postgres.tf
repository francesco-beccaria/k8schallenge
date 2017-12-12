resource "azurerm_postgresql_server" "etms" {
  name                = "tf-pr-postgresql-1"
  location            = "${azurerm_resource_group.producer.location}"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  sku {
    name = "PGSQLB50"
    capacity = 50
    tier = "Basic"
  }

  administrator_login = "postgres"
  administrator_login_password = "@P0stgr3s-01"
  version = "9.5"
  storage_mb = "51200"
  ssl_enforcement = "Enabled"
}

resource "azurerm_postgresql_database" "etms" {
  name                = "etms"
  resource_group_name = "${azurerm_resource_group.producer.name}"
  server_name         = "${azurerm_postgresql_server.etms.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_firewall_rule" "etms" {
  name                = "etms-fw"
  resource_group_name = "${azurerm_resource_group.producer.name}"
  server_name         = "${azurerm_postgresql_server.etms.name}"
  start_ip_address    = "10.0.2.0"
  end_ip_address      = "10.0.2.255"
}