resource "azurerm_kubernetes_cluster" "main" {
  name                = var.name
  location            = var.rg_location
  resource_group_name = var.rg_name
  dns_prefix          = "roboshop"

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "standard_d2_v4"
    vnet_subnet_id = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
  }

  identity {
    type = "SystemAssigned"
  }

  aci_connector_linux {
    subnet_name = "/subscriptions/eb986b09-9743-4aa1-b10f-53da04d8708c/resourceGroups/my-first-rg/providers/Microsoft.Network/virtualNetworks/test-network/subnets/default"
  }

  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.100.0.0/24"
    dns_service_ip = "10.100.0.10"
  }

}

