resource "azurerm_network_security_rule" "main-sg-rule-ssh" {
  name                        = "${azurerm_network_security_group.lbg-pega-main-sg.name}-rule-ssh"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${azurerm_virtual_network.lbg-pega-vnet.address_space[0]}"
  destination_address_prefix  = "${azurerm_virtual_network.lbg-pega-vnet.address_space[0]}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-main-sg.name}"
}

resource "azurerm_network_security_rule" "universal-sg-rule-ssh-az1" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-ssh-az1"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${azurerm_virtual_network.lbg-pega-vnet.address_space[0]}"
  destination_address_prefix  = "${azurerm_subnet.az1-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}


resource "azurerm_network_security_rule" "universal-sg-rule-ssh-az2" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-ssh-az2"
  priority                    = 102
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "${azurerm_virtual_network.lbg-pega-vnet.address_space[0]}"
  destination_address_prefix  = "${azurerm_subnet.az2-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}

resource "azurerm_network_security_rule" "universal-sg-rule-http-az1" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-http-az1"
  priority                    = "103"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "${azurerm_subnet.az1-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}


resource "azurerm_network_security_rule" "universal-sg-rule-http-az2" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-http-az2"
  priority                    = "104"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "${azurerm_subnet.az2-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}

resource "azurerm_network_security_rule" "universal-sg-rule-https-az1" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-https-az1"
  priority                    = 105
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "${azurerm_subnet.az1-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}


resource "azurerm_network_security_rule" "universal-sg-rule-https-az2" {
  name                        = "${azurerm_network_security_group.lbg-pega-universal-sg.name}-rule-https-az2"
  priority                    = 106
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "${azurerm_subnet.az2-universal.address_prefix}"
  resource_group_name         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  network_security_group_name = "${azurerm_network_security_group.lbg-pega-universal-sg.name}"
}
