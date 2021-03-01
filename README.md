# terraformVmwNsxtUbuntu

## Goals
Spin up an Ubuntu host (through userdata) in vCenter from content library and configure a tag in NSX-T based on Terraform

## Prerequisites:
- Make sure terraform in installed in the orchestrator VM
- Make sure VMware credential/details are configured as environment variable for Vcenter:
```
TF_VAR_vsphere_user=******
TF_VAR_vsphere_server=******
TF_VAR_vsphere_password=******
```
- Make sure VMware credential/details are configured as environment variable for NSXT:
```
TF_VAR_nsx_user=******
TF_VAR_nsx_password=******
TF_VAR_nsx_server=******
```

## Environment:

Terraform Plan has/have been tested against:

### terraform

```
Terraform v0.13.1
+ provider registry.terraform.io/hashicorp/null v2.1.2
+ provider registry.terraform.io/hashicorp/template v2.1.2
+ provider registry.terraform.io/hashicorp/vsphere v1.24.0
+ provider registry.terraform.io/terraform-providers/nsxt v3.0.1
Your version of Terraform is out of date! The latest version is 0.13.2. You can update by downloading from https://www.terraform.io/downloads.html
```

### V-center/ESXi version:
```
vCSA - 7.0.0 Build 16749670
ESXi host - 7.0.0 Build 16324942
```

### NSXT version:
```
NSX 3.0.1.1
```

## Input/Parameters:

1. All the paramaters/variables are stored in variables.tf

## Use the the terraform script to:
- Spin up an ubuntu host based on content library based static IP
- Assign specific Tag for this VM in NSXT

## Run the terraform plan:
```
git clone https://github.com/tacobayle/terraformVmwNsxtUbuntu ; cd terraformVmwNsxtUbuntu ; terraform init ; terraform apply -auto-approve
```
