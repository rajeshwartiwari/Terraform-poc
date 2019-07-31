resource "azurerm_sql_server" "lbg-pega-sql-1" {
  name                         = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-sql"
  resource_group_name          = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  location                     = "${var.azureRegion}"
  version                      = "12.0"
  administrator_login          = "${var.hostUsername}"
  administrator_login_password = "${var.hostPassword}"

tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    region = "${var.azureRegion}"
    role = "database"
    resource = "sqlserver"
  }
}

