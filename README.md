# Azure Dev Box Terraform Sample

This repository demonstrates how to provision Azure Dev Box resources using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- An Azure subscription with permissions to create Dev Center resources

## Setup

1. **Clone this repository:**
   ```sh
   git clone https://github.com/your-org/devbox-terraform.git
   cd devbox-terraform
   ```

2. **Authenticate with Azure:**
   ```sh
   az login
   ```

3. **Configure backend:**
   Edit `backend.tf` and update the `resource_group_name`, `storage_account_name`, and `container_name` with your Azure Storage details.

4. **Initialize Terraform:**
   ```sh
   terraform init
   ```

5. **Review and apply the plan:**
   ```sh
   terraform plan
   terraform apply
   ```

## Files

- `main.tf` – Main resource definitions
- `devbox-definition.tf` – Dev Box definitions
- `variables.tf` – Input variables
- `outputs.tf` – Output values
- `backend.tf` – Remote state backend configuration
- `pool.tf` – Dev Box pool configuration
- `network.tf` – Network configuration
- `devcenter.tf` – Dev Center configuration
- `role.tf` – Role assignment configuration
- `project.tf` – Project configuration
- `hack.tf` – hack to enable hibernation

## Notes

- The `provider "azurerm"` block requires `features {}`.
- Ensure your Azure resources (storage account, container) exist before running `terraform init`.
- Update resource names and IDs as needed for your environment.

## Clean Up

To destroy all resources created by this configuration:

```sh
terraform destroy
```

## References

- [Azure Dev Box documentation](https://learn.microsoft.com/azure/dev-box/)
- [Terraform AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- Hack to enable hibernation: [GitHub issue](https://github.com/hashicorp/terraform-provider-azurerm/issues/26703#issuecomment-2528632464)