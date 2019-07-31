resource "azurerm_resource_group" "lbg-pega-resourcegroup" {
  name     = "${var.resourceGroup}"
  location = "${var.azureRegion}"
  
  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${var.azureRegion}"
    resource = "resourcegroup"
  }
}
