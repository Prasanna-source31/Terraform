resource "azurerm_virtual_network" "invalid_vnet" {
  name                = "invalid-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "invalid-rg"
}

resource "azurerm_storage_account" "valid_storage" {
  name                     = "validsa123"
  resource_group_name      = "dev-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_virtual_network" "valid_vnet" {
  name                = "vn-dev"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "dev-rg"
}

resource "azurerm_storage_account" "invalid_storage" {
  name                     = "invalid-storage"
  resource_group_name      = "staging-rg"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
