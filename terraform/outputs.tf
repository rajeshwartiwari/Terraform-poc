
output "VMs" {
  value = [ "${azurerm_virtual_machine.lbg-pega-universal-1.name} : ${azurerm_network_interface.lbg-pega-if-universal-1.private_ip_address}",
        ]
}

output "Authentication" {
  value = [ "${var.hostUsername} : ${var.hostPassword}",
        ] 
}
