resource "azurerm_sql_database" "lbg-pega-sqldb-1" {
  name                = "PEGADB"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  location            = "${var.azureRegion}"
  server_name         = "${azurerm_sql_server.lbg-pega-sql-1.name}"
  edition             = "Standard"
  requested_service_objective_name = "S6"

  depends_on = [ "azurerm_sql_firewall_rule.lbg-pega-sqldb-fw-rule-1" ]

  import {
      storage_uri = "${var.pegaDbFile}"
      storage_key = "${var.pegaDbAccessKey}"
      storage_key_type = "StorageAccessKey"
      administrator_login = "${var.hostUsername}"
      administrator_login_password = "${var.hostPassword}" 
      authentication_type = "SQL"
  }

  tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    region = "${var.azureRegion}"
    role = "database"
    resource = "database"
  }
}
