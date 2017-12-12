# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.az_sub_id}"
  client_id       = "${var.az_cli_id}"
  client_secret   = "${var.az_cli_scrt}"
  tenant_id       = "${var.az_tenant_id}"
}

/*provider "azure" {
  publish_settings = "${file("/home/emanuele/ecloro-credentials.publishsettings")}"
}

resource "azure_hosted_service" "terraform-service" {
  name               = "terraform-service"
  location           = "North Europe"
  ephemeral_contents = false
  description        = "Hosted service created by Terraform."
  label              = "tf-hs-01"
}
resource "azure_instance" "web" {
  name                 = "terraform-test"
  hosted_service_name  = "${azure_hosted_service.terraform-service.name}"
  image                = "Ubuntu Server 14.04 LTS"
  size                 = "Basic_A1"
  storage_service_name = "yourstorage"
  location             = "West US"
  username             = "terraform"
  password             = "Pass!admin123"
  domain_name          = "contoso.com"
  domain_ou            = "OU=Servers,DC=contoso.com,DC=Contoso,DC=com"
  domain_username      = "Administrator"
  domain_password      = "Pa$$word123"

  endpoint {
    name         = "SSH"
    protocol     = "tcp"
    public_port  = 22
    private_port = 22
  }
}*/