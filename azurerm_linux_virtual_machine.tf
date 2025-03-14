# azurerm_linux_virtual_machine.tf
#
# Manages a Linux Virtual Machine.
#
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    # This demo uses the admin SSH key file `id_rsa.pub` which is generated as
    # described in the README.md, and which doesn't use a password or encryption. 
    # If you are working on a production project, then typically you would use your
    # own SSH key file such as on your local system path at `~/.ssh/id_rsa.pub`, 
    # or managed by your team's password management software such as HashiCorp Vault.
    public_key = file("id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
