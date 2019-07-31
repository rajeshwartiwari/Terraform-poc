resource "azurerm_network_security_group" "lbg-pega-main-sg" {
  name                = "${azurerm_virtual_network.lbg-pega-vnet.name}-vnet-securitygroup"
  location            = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
 
 tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    role = "main"
    resource = "securitygroup"
  }
}
resource "azurerm_network_security_group" "lbg-pega-universal-sg" {
  name                = "${azurerm_virtual_network.lbg-pega-vnet.name}-universal-securitygroup"
  location            = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"

  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    role = "universal"
    resource = "securitygroup"
  }
}

