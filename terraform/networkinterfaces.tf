resource "azurerm_network_interface" "lbg-pega-if-universal-1" {
  name                = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-if-UNI001"
  location            = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"

  ip_configuration {
    name                          = "if-UNI001"
    subnet_id                     = "${azurerm_subnet.az1-universal.id}"
    private_ip_address_allocation = "dynamic"
    load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.lbg-pega-lb-1-pool-1.id}"]
  }
}
