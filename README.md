# EC2 Instance

## Description
This stack will deploy an ec2 instances

![version](https://img.shields.io/badge/version-2-black) ![keywords](https://img.shields.io/badge/keywords-ec2-brightgreen) ![keywords](https://img.shields.io/badge/keywords-instance-brightgreen) ![keywords](https://img.shields.io/badge/keywords-server-brightgreen) ![keywords](https://img.shields.io/badge/keywords-vm-brightgreen) ![keywords](https://img.shields.io/badge/keywords-virtual%20machine-brightgreen) ![keywords](https://img.shields.io/badge/keywords-provider:aws-brightgreen) ![technology](https://img.shields.io/badge/technology-aws-orange)

![Image](https://www.netreo.com/wp-content/uploads/200px-AWS_Simple_Icons_Compute_Amazon_EC2_Instances.svg_.png
)

## Author
CTO

## Config
### Default
- **Name:** `AWS`
- **Description:** Terraform plan and apply
- **Cloud Provider:** aws
  - **Pipeline Path:** `pipeline/workflow.yml`
  - **Variables Path:** `pipeline/concourse_variables.yml`
  - **Destination:** `($ project $)/pipeline/($ environment $)/variables.yml`


## Form

## Use Case: default

### Section: AWS

#### Group: Early adopters

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `who` | Use case | `dropdown` | `string` | `Required` | `cycloid` |
#### Group: Location

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `aws_account_id` | AWS Account ID | `dropdown` | `map` | `Required` | `` |
| `aws_region` | AWS Region | `dropdown` | `string` | `Required` | `` |
### Section: Virtual Machine

#### Group: Instance

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `instance_name` | Instance Name | `simple_text` | `string` | `Required` | `` |
| `ami` | Instance AMI | `simple_text` | `string` | `Required` | `` |
| `instance_type` | Instance type | `simple_text` | `string` | `Required` | `t3.micro` |
| `key_pair` | Key pair | `simple_text` | `string` | `Optional` | `` |
| `iam_instance_profile` | IAM Instance Profile | `simple_text` | `string` | `Optional` | `` |
| `enable_termination_protection` | Enable termination protection | `switch` | `boolean` | `Required` | `False` |
| `enable_shutdown_protection` | Enable shutdown protection | `switch` | `boolean` | `Required` | `False` |
#### Group: Network

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `subnet_id` | Subnet | `simple_text` | `string` | `Required` | `` |
| `vpc_security_group_ids` | Security Group | `cy_inventory_resource` | `array` | `Optional` | `` |
#### Group: Backup

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `backup` | Backup | `dropdown` | `string` | `Required` | `no` |
| `archiving` | Archiving | `switch` | `boolean` | `Required` | `False` |
### Section: Storage

#### Group: Security

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `kms_key_id` | KMS Key ARN | `cy_inventory_resource` | `string` | `Required` | `` |
#### Group: Main disk

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `root_block_device_size` | Root volume size | `simple_text` | `string` | `Required` | `` |
| `root_block_device_type` | Root volume type | `dropdown` | `map` | `Required` | `GP3 - General Purpose - Up to 16,000 IOPS` |
#### Group: Additional disks

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `ebs_block_device_map` | Additional disks | `text_area` | `map` | `Optional` | `{}` |
### Section: Applications

#### Group: Details

| Key | Name | Widget | Type | Required | Default |
| --- | ---- | ------ | ---- | -------- | ------- |
| `app_name` | Application Name | `simple_text` | `string` | `Required` | `cycloid` |
| `app_code` | Application Code | `simple_text` | `string` | `Required` | `APP00000` |
| `data_classification` | Data confidentiality | `dropdown` | `string` | `Required` | `C1` |
| `app_env` | Application Environment | `dropdown` | `string` | `Required` | `prd` |
| `aws_id` | FinOps ID | `simple_text` | `string` | `Required` | `XXXXXXXXXXXXXXXXXXXX` |
| `extra_tags` | Extra Tags | `text_area` | `map` | `Optional` | `{}` |

## Pipeline variables

|Name|Description|Type|Default|Required|
|---|---|:---:|:---:|:---:|
|`aws_cred`|Amazon credentials containing access key and secret key for Terraform. See value format [here](https://docs.cycloid.io/advanced-guide/integrate-and-use-cycloid-credentials-manager.html#vault-in-the-pipeline)|`-`|`((s3-backend-for-terraform-state-files))`|`True`|
|`config_git_branch`|Branch to use on the config Git repository.|`-`|`($ cr_branch $)`|`True`|
|`config_git_password`|Password to fetch the config Git repository.|`-`|`((gitlab.password))`|`True`|
|`config_git_repository`|Git repository URL containing the config of the stack.|`-`|`($ cr_url $)`|`True`|
|`config_git_username`|Username to fetch the config Git repository.|`-`|`((gitlab.username))`|`True`|
|`config_terraform_path`|Path of Terraform files in the config git repository|`-`|`($ project $)/pipeline/($ environment $)`|`True`|
|`customer`|Name of the Cycloid Organization, used as customer variable name.|`-`|`($ organization_canonical $)`|`True`|
|`cycloid_api_key`|API key to grant admin acess to Cycloid API.|`-`|`((cycloid-api-key.key))`|`True`|
|`cycloid_inventory_jwt`|JWT token to access Cycloid inventory (acting as HTTP Terraform backend).|`-`|`($ inventory_jwt $)`|`True`|
|`env`|Name of the project's environment.|`-`|`($ environment $)`|`True`|
|`key_pair`|key_pair associated to the EC2.|`-`|`""`|`False`|
|`project`|Name of the project.|`-`|`($ project $)`|`True`|
|`registry_password`|Password for regular image repository, otherwise leave it as a empty string|`-`|`((gitlab_terraform_registry.password))`|`True`|
|`registry_username`|Username for regular image repository, otherwise leave it as a empty string|`-`|`((gitlab_terraform_registry.username))`|`True`|
|`stack_git_branch`|Branch to use on the stack Git repository.|`-`|`($ scs_branch $)`|`True`|
|`stack_git_password`|Password to fetch the stack Git repository.|`-`|`((gitlab.password))`|`True`|
|`stack_git_repository`|Git repository URL containing the stack.|`-`|`($ scs_url $)`|`True`|
|`stack_git_username`|Username to fetch the stack Git repository.|`-`|`((gitlab.username))`|`True`|
|`stack_terraform_path`|Path of Terraform files in the stack git repository|`-`|`ec2-instance/terraform`|`True`|
|`terraform_version`|terraform version used to execute your code.|`-`|`"1.6.1"`|`True`|
|`vpc_security_group_ids`|vpc_security_group_ids IDs.|`-`|`"[]"`|`False`|

## Workflow

### Groups

#### create

- `terraform-plan`
- `terraform-apply`

#### destroy

- `terraform-destroy`


### Job: `terraform-plan`

├── Get: stack-source<br/>
├── Get: stack-config<br/>
├── Task: merge-stack-source-and-config<br/>
│     └── **Inputs**<br/>
│         └── 📄 stack-config<br/>
│         └── 📄 stack-source<br/>
│     └── **Params**<br/>
│         └── ⚙️ CONFIG_PATH: ((config_terraform_path))<br/>
│         └── ⚙️ STACK_PATH: ((stack_terraform_path))<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
├── Task: set-credentials-docker-registry<br/>
│     └── **Inputs**<br/>
│         └── 📄 merged-stack<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
└── Put: tfstate<br/>

### Job: `terraform-apply`

├── Get: stack-source<br/>
├── Get: stack-config<br/>
├── Get: tfstate<br/>
├── Task: merge-stack-source-and-config<br/>
│     └── **Inputs**<br/>
│         └── 📄 stack-config<br/>
│         └── 📄 stack-source<br/>
│     └── **Params**<br/>
│         └── ⚙️ CONFIG_PATH: ((config_terraform_path))<br/>
│         └── ⚙️ STACK_PATH: ((stack_terraform_path))<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
├── Task: set-credentials-docker-registry<br/>
│     └── **Inputs**<br/>
│         └── 📄 merged-stack<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
└── Put: tfstate<br/>

### Job: `terraform-destroy`

├── Get: stack-source<br/>
├── Get: stack-config<br/>
├── Task: merge-stack-source-and-config<br/>
│     └── **Inputs**<br/>
│         └── 📄 stack-config<br/>
│         └── 📄 stack-source<br/>
│     └── **Params**<br/>
│         └── ⚙️ CONFIG_PATH: ((config_terraform_path))<br/>
│         └── ⚙️ STACK_PATH: ((stack_terraform_path))<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
├── Task: set-credentials-docker-registry<br/>
│     └── **Inputs**<br/>
│         └── 📄 merged-stack<br/>
│     └── **Outputs**<br/>
│         └── 📝 merged-stack<br/>
└── Put: tfstate<br/>
