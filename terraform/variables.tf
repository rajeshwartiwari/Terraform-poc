variable "resourceGroup" {
  type    = "string"
  default = "lbg-pega-poc"
}

variable "vnetCidr" {
    type = "string"
    default = "172.21"
}

variable "azureRegion" {
    type = "string"
    default = "UK South"
}

variable "targetEnvType" {
    type = "string"
    default = "dev"
}

variable "hostUsername" {
    type = "string"
    default = ""
}

variable "hostPassword" {
    type = "string"
    default = ""
}

variable "vmSize" {
    type = "string"
    default = "Standard_D2s_v3"
}

variable "vmImageDate" {
    type = "string"
    default = ""
}

variable "pegaDbFile" {
    type = "string"
    default = ""
}

variable "pegaDbAccessKey" {
    type = "string"
    default = ""
}