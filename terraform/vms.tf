resource "azurerm_virtual_machine" "lbg-pega-universal-1" {
  name                  = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-UNI001"
  location              = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
  resource_group_name   = "${azurerm_resource_group.lbg-pega-resourcegroup.name}" 
  network_interface_ids = ["${azurerm_network_interface.lbg-pega-if-universal-1.id}"]
  vm_size               = "${var.vmSize}"
  availability_set_id   = "${azurerm_availability_set.lbg-pega-as-1.id}"

  delete_os_disk_on_termination = false
  delete_data_disks_on_termination = false

  storage_image_reference {
    id = "/subscriptions/4d6e6d9b-ba12-4c6a-a01b-113006981c29/resourceGroups/lbg-pega-assets/providers/Microsoft.Compute/images/lbg-pega-rhel-image-${var.vmImageDate}"
  }

  storage_os_disk {
    create_option     = "FromImage"
    name              = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-UNI001-OS-${var.vmImageDate}"
    caching           = "ReadWrite"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-UNI001"
    admin_username = "${var.hostUsername}"
    admin_password = "${var.hostPassword}"
  }
  
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    region = "${var.azureRegion}"
    role = "universal"
    resource = "vm"
  }
}
