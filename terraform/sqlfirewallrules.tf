resource "azurerm_sql_firewall_rule" "lbg-pega-sqldb-fw-rule-1" {
  name                = "${azurerm_sql_server.lbg-pega-sql-1.name}-fw-rule-1"
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  server_name         = "${azurerm_sql_server.lbg-pega-sql-1.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}