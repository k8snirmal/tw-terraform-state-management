UNAME:= $(shell uname)
ifeq ($(UNAME),Darwin)
		OS_X  := true
		SHELL := /bin/bash
else
		OS_DEB  := true
		SHELL := /bin/bash
endif

working_dir:= $(shell pwd)

TERRAFORM:= $(shell command -v terraform 2> /dev/null)
TERRAFORM_VERSION:= "1.4.4"

ifeq ($(OS_X),true)
		TERRAFORM_MD5:= $(shell md5 -q `which terraform`)
		TERRAFORM_REQUIRED_MD5:= 13185df42df6c8516791f7be71c352f8
else
		TERRAFORM_MD5:= $(shell md5sum - < `which terraform` | tr -d ' -')
		TERRAFORM_REQUIRED_MD5:= 13185df42df6c8516791f7be71c352f8
endif

check:
	@echo "Checking Terraform version... success expecting md5 of [${TERRAFORM_REQUIRED_MD5}], found [${TERRAFORM_MD5}]"
	@if [ "${TERRAFORM_MD5}" != "${TERRAFORM_REQUIRED_MD5}" ]; then echo "Please ensure you are running terraform ${TERRAFORM_VERSION}."; exit 1; fi


default:
	@echo "Creates a Terraform system from a template."
	@echo "The following commands are available:"
	@echo " - tflint             : runs terraform init for an environment"
	@echo " - tfsec              : runs terraform init for an environment"
	@echo " - init               : runs terraform init for an environment"
	@echo " - plan               : runs terraform plan for an environment"
	@echo " - apply              : runs terraform apply for an environment"
	@echo " - destroy            : will delete the entire project's infrastructure"

tflint/:
	@echo "Running terraform lint scan..."
	@tflint --config tflint.hcl

tfsec/:
	@echo "Running terraform security scan..."
	@tfsec --minimum-severity CRITICAL  --minimum-severity HIGH

init/: check
	@terraform fmt
	@echo "Pulling the required modules..."
	@terraform init -backend-config=backend.tfvars
	@terraform validate

plan/: check
	@echo “Running terraform plan…”
	@terraform plan -var-file terraform.tfvars -out terraform-plan-output.plan

apply/: check
	@terraform apply terraform-plan-output.plan
	

destroy/: check
	@echo "## 💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥 ##"
	@echo "Are you really sure you want to completely destroy environment ?"
	@echo "## 💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥 ##"
	@read -p "Press enter to continue"
	@terraform plan -destroy -var-file terraform.tfvars -out terraform.tfplan
	@terraform apply terraform.tfplan
