# Demo Tofu Azure

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

Create these files:

* [providers.tf](providers.tf)
* [variables.tf](variables.tf)
* [main.tf](main.tf)
* [outputs.tf](outputs.tf)


## tofu init

Run:

```sh
tofu init -upgrade
```

Output:

```stdout
Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/azurerm versions matching "~> 3.0"...
- Finding hashicorp/random versions matching "~> 3.0"...
- Installing hashicorp/azurerm v3.117.1...
- Installed hashicorp/azurerm v3.117.1 (signed, key ID 0C0AF313E5FD9F80)
- Installing hashicorp/random v3.7.1...
- Installed hashicorp/random v3.7.1 (signed, key ID 0C0AF313E5FD9F80)

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
