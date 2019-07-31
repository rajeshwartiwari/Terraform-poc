 resource "azurerm_virtual_network" "lbg-pega-vnet" {
  name                = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-vnet"
  location            = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  address_space       = ["${var.vnetCidr}.0.0/16"]
  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    resource = "vnet"
  }
}
