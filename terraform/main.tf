terraform {
 backend "azurerm" {
    storage_account_name = "lbgpegatfstorage"
    container_name       = "tfstate"
    access_key           = "ZvcU8tRXDOgFso8t5XS0yQU2s4gbGrUusRydKuNbTMfkNR4WMbRG6Cl95UwYLS41+2bjIh3dn0J3rU6+WB15CA=="
    key                  = "lbg-pega-dev.terraform.tfstate"
  }
} 
