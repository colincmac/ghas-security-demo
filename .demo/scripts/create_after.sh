#! /bin/bash

#
# We can only do so much from Terraform with the initialization of the
# repository. This script will perform some extra setup steps necessary
# to initialize the repository state.
#

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Encode JSON payload in base64 to prevent issues passing it through
TERRAFORM_PARAMETERS_B64=`echo "${TERRAFORM_PARAMETERS}" | base64`

docker run \
  -v $DIR/ansible:/ansible \
  -w /ansible \
  -e WORKFLOW_GITHUB_DEMO_ORGANIZATION_TOKEN="${WORKFLOW_GITHUB_DEMO_ORGANIZATION_TOKEN}" \
  -e WORKFLOW_GITHUB_TEMPLATE_ORGANIZATION_TOKEN="${WORKFLOW_GITHUB_TEMPLATE_ORGANIZATION_TOKEN}" \
  -e WORKFLOW_GITHUB_ACTIONS_TOKEN="${WORKFLOW_GITHUB_ACTIONS_TOKEN}" \
  -e WORKFLOW_AUTH_TEMPLATE_ORGANIZATION_HEADER="${WORKFLOW_AUTH_TEMPLATE_ORGANIZATION_HEADER}" \
  -e WORKFLOW_AUTH_DEMO_ORGANIZATION_HEADER="${WORKFLOW_AUTH_DEMO_ORGANIZATION_HEADER}" \
  -e TERRAFORM_PARAMETERS_B64="${TERRAFORM_PARAMETERS_B64}" \
  ghcr.io/octodemo/container-ansible-development:base-20210217 \
  ./post_repository_creation.yml \
  -vvv