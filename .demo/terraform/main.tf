terraform {
  required_version = ">=1.3"
}

#
# backend is dynamically generated and injected by terragrunt
#


module "azure" {
  source = "./modules/azure"

  azure_context         = var.azure_context
  azure_resource_suffix = "${var.github_context.target_repository.owner}-${var.github_context.target_repository.repo}"
  extra_tags            = var.cloud_context.tags
}


module "github" {
  source = "./modules/github"

  github_token              = var.github_token
  actor                     = var.github_context.actor
  target_repository         = var.github_context.target_repository
  template_directory_path   = var.github_context.template_repository_directory_path

  azure = {
    service_plan_name   = module.azure.service_plan_name
    resource_group_name = module.azure.resource_group_name
  }
}


output "repository_url" {
  value       = module.github.repository_url
  description = "GitHub repository URL"
}

output "repository_full_name" {
  value       = module.github.repository_full_name
  description = "GitHub repository full name"
}

output "resource_tags" {
  value = module.azure.resource_tags
  description = "Azure Resource Tags that were applied"
}