resource "azurerm_availability_set" "lbg-pega-as-1" {
  name                = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-as-1"
  location            = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  managed             = true
  platform_fault_domain_count = 2

 tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    role = "universal"
    resource = "availabilityset"
  }

}