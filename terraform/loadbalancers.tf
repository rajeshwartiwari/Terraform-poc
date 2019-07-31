resource "azurerm_lb" "lbg-pega-lb-1" {
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  name                = "${azurerm_resource_group.lbg-pega-resourcegroup.name}-lb-1"
  location            = "${var.azureRegion}"

  frontend_ip_configuration {
    name                 = "lbg-pega-lb-ip"
    subnet_id = "${azurerm_subnet.az1-universal.id}"
  }

   tags {
    environment = "${var.targetEnvType}"
    workload = "pega"
    location = "${azurerm_resource_group.lbg-pega-resourcegroup.location}"
    role = "universal"
    resource = "loadbalancer"
  }

}

resource "azurerm_lb_backend_address_pool" "lbg-pega-lb-1-pool-1" {
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  loadbalancer_id     = "${azurerm_lb.lbg-pega-lb-1.id}"
  name                = "lbg-pega-lb-1-pool-1"
}

resource "azurerm_lb_probe" "lbg-pega-lb-1-probe-1" {
  resource_group_name = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  loadbalancer_id     = "${azurerm_lb.lbg-pega-lb-1.id}"
  name                = "httpProbe"
  protocol            = "http"
  request_path        = "/"
  port                = 8080
  interval_in_seconds = 5
  number_of_probes    = 2
}

resource "azurerm_lb_rule" "lbg-pega-lb-1-rule-http" {
  resource_group_name            = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  loadbalancer_id                = "${azurerm_lb.lbg-pega-lb-1.id}"
  name                           = "lbg-pega-lb-1-rule-http"
  protocol                       = "tcp"
  frontend_port                  = 80
  backend_port                   = 8080
  frontend_ip_configuration_name = "lbg-pega-lb-ip"
  enable_floating_ip             = false
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.lbg-pega-lb-1-pool-1.id}"
  idle_timeout_in_minutes        = 5
  probe_id                       = "${azurerm_lb_probe.lbg-pega-lb-1-probe-1.id}"
}


resource "azurerm_lb_rule" "lbg-pega-lb-1-rule-https" {
  resource_group_name            = "${azurerm_resource_group.lbg-pega-resourcegroup.name}"
  loadbalancer_id                = "${azurerm_lb.lbg-pega-lb-1.id}"
  name                           = "lbg-pega-lb-1-rule-https"
  protocol                       = "tcp"
  frontend_port                  = 443
  backend_port                   = 8443
  frontend_ip_configuration_name = "lbg-pega-lb-ip"
  enable_floating_ip             = false
  backend_address_pool_id        = "${azurerm_lb_backend_address_pool.lbg-pega-lb-1-pool-1.id}"
  idle_timeout_in_minutes        = 5
  probe_id                       = "${azurerm_lb_probe.lbg-pega-lb-1-probe-1.id}"
}
