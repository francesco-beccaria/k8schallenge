resource "azurerm_public_ip" "lbip" {
  name                         = "ETMSPublicIPAddress"
  location                     = "East US"
  resource_group_name          = "${azurerm_resource_group.producer.name}"
  public_ip_address_allocation = "static"
}

resource "azurerm_lb" "prlb" {
  name                = "producer-lb"
  location            = "East US"
  resource_group_name = "${azurerm_resource_group.producer.name}"

  frontend_ip_configuration {
    name                 = "ETMSPublicIPConf"
    public_ip_address_id = "${azurerm_public_ip.lbip.id}"
  }
}

resource "azurerm_lb_backend_address_pool" "wsip" {
  resource_group_name = "${azurerm_resource_group.producer.name}"
  loadbalancer_id     = "${azurerm_lb.prlb.id}"
  name                = "WSBackEndAddressPool"
}

resource "azurerm_lb_rule" "natws" {
  resource_group_name            = "${azurerm_resource_group.producer.name}"
  loadbalancer_id                = "${azurerm_lb.prlb.id}"
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 8080
  backend_port                   = 8080
  frontend_ip_configuration_name = "ETMSPublicIPConf"
}