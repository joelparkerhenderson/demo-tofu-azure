# example Tofu Azure

Demonstration of OpenTofu with Microsoft Azure.


## OpenTofu

Install OpenTofu as you like.

Install using macOS brew:

```sh
brew update && brew install opentofu
```

Verify:

```sh
tofu -version
```


## Azure command line interface (CLI)

Get the Azure command line interface program.

https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos#install-with-homebrew

Install using macOS brew:

```sh
brew update && brew install azure-cli
```

Verify:

```sh
az --version
```

Upgrade:

```sh
az upgrade
```


## Azure login

Run:

```sh
az login
```

You should see a web page open in your browser, and you should be able to set up your own Microsoft account, then login.

Success looks like: "You have logged into Microsoft Azure! You can close this window, or we will redirect you to the Azure CLI documentation in 1 minute."

Output:

```stdout
Retrieving tenants and subscriptions for the selection...

[Tenant and subscription selection]

No     Subscription name    Subscription ID                       Tenant
-----  -------------------  ------------------------------------  -----------------
[1] *  Pay-As-You-Go        8c6021f0-7c3d-6b0a-d2f8-e9f54b99e8fc  Default Directory
                            
The default is marked with an *; the default tenant is 'Default Directory' and subscription is 'Pay-As-You-Go' (8c6021f0-7c3d-6b0a-d2f8-e9f54b99e8fc).
```

Run:

```sh
az account show
```

Output:

```json
{
  "environmentName": "AzureCloud",
  "homeTenantId": "44018371-386c-42c3-b28c-7e4068f4dc43",
  "id": "f7074d20-2f52-4648-8100-81db97ae0e1f",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantDefaultDomain": "joeljoelparkerhenderson.onmicrosoft.com",
  "tenantDisplayName": "Default Directory",
  "tenantId": "44018371-386c-42c3-b28c-7e4068f4dc43",
  "user": {
    "name": "joel@joelparkerhenderson.com",
    "type": "user"
  }
}
```

If you see these kinds of syntax errors, then you can ignore them, because they will be fixed in future versions:

```stdout
SyntaxWarning: invalid escape sequence …
```


## Create resources

https://learn.microsoft.com/en-us/azure/developer/terraform/create-resource-group

Create the starter files:

* [providers.tf](providers.tf)
* [main.tf](main.tf)
* [outputs.tf](outputs.tf)
* [variables.tf](variables.tf)
* [random_pet.tf](random_pet.tf)

Create networking files:

* [azurerm_public_ip.tf](azurerm_public_ip.tf)
* [azurerm_resource_group.tf](azurerm_resource_group.tf)
* [azurerm_virtual_network.tf](azurerm_virtual_network.tf)
* [azurerm_network_interface.tf](azurerm_network_interface.tf)
* [azurerm_network_security_group.tf](azurerm_network_security_group.tf)

Create virtual machine files:

* [azurerm_linux_virtual_machine.tf](azurerm_linux_virtual_machine.tf)
* [azurerm_windows_virtual_machine.tf](azurerm_windows_virtual_machine.tf)

Create  database files:

* [azurerm_postgresql_server.tf](azurerm_postgresql_server.tf)
* [azurerm_postgresql_database.tf](azurerm_postgresql_database.tf)


## Create a security key

Create your local security key that will be involved in the Linux virtual machine.

For this demonstration, you can create a low-security key with no password and plain text.

Run:

```sh
ssh-keygen -t rsa -b 4096 -C "example@example.com" -q -N "" -f id_rsa
```

The output is two files:

* [id_rsa](id_rsa) is your private key; this stays on you local system.

* [id_rsa.pub] is your public key; this gets sent to the Linux virtual server.

If you are working on a production project, then you should instead generate your RSA key with a strong password and strong encryption.


## tofu init

Run:

```sh
tofu init -upgrade
```

Output:

```stdout
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/random versions matching "~> 3.0"...
- Finding hashicorp/time versions matching "0.9.1"...
- Finding hashicorp/azurerm versions matching "~> 3.0"...
- Using previously-installed hashicorp/random v3.7.1
- Using previously-installed hashicorp/time v0.9.1
- Using previously-installed hashicorp/azurerm v3.117.1

Providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://opentofu.org/docs/cli/plugins/signing/

OpenTofu has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that OpenTofu can guarantee to make the same selections by default when
you run "tofu init" in the future.

OpenTofu has been successfully initialized!

You may now begin working with OpenTofu. Try running "tofu plan" to see
any changes that are required for your infrastructure. All OpenTofu commands
should now work.

If you ever set or change modules or backend configuration for OpenTofu,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```


## tofu plan

Run:

```sh
tofu plan
```

Output:

```stdout
OpenTofu used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

OpenTofu will perform the following actions:

  # azurerm_resource_group.rg will be created
  + resource "azurerm_resource_group" "rg" {
      + id       = (known after apply)
      + location = "eastus"
      + name     = (known after apply)
    }

  # random_pet.rg_name will be created
  + resource "random_pet" "rg_name" {
      + id        = (known after apply)
      + length    = 2
      + prefix    = "rg"
      + separator = "-"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + resource_group_name = (known after apply)
```


## Azure mobile app (optional)

Get the Azure mobile app, if you want.

Android:

* https://play.google.com/store/apps/details?id=com.microsoft.azure
