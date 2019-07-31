resource "azurerm_route_table" "lbg-pega-main-rt" {
  name                          = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-main-rt"
  location                      = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name           = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  disable_bgp_route_propagation = false

  route {
    name           = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-main-rt-route1"
    address_prefix = "${azurerm_virtual_network.lbg-pega-vnet.address_space[0]}"
    next_hop_type  = "vnetlocal"
  }

  route {
    name           = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-main-rt-vpn1"
    address_prefix = "10.0.0.0/8"
    next_hop_type  = "VirtualNetworkGateway"
  }

  route {
    name           = "default"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "internet"
  }

  
  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    role = "main"
    resource = "routetable"
  }
}
