resource azurerm_subnet "az1-universal" {
    name           = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-az1-universal"
    address_prefix = "${var.vnetCidr}.1.0/24"
    resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
    virtual_network_name = "${azurerm_virtual_network.lbg-pega-vnet.name}"
    route_table_id = "${azurerm_route_table.lbg-pega-main-rt.id}"
    network_security_group_id = "${azurerm_network_security_group.lbg-pega-universal-sg.id}"
   
}

resource azurerm_subnet "az2-universal" {
    name           = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-az2-universal"
    address_prefix = "${var.vnetCidr}.2.0/24"
    resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
    virtual_network_name = "${azurerm_virtual_network.lbg-pega-vnet.name}"
    route_table_id = "${azurerm_route_table.lbg-pega-main-rt.id}"
    network_security_group_id = "${azurerm_network_security_group.lbg-pega-universal-sg.id}"
 
}
