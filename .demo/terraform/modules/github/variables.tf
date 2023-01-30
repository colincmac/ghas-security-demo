variable "github_token" {
  type        = string
  sensitive   = true
  description = "GitHub Token with access to the organization and repository for provisioning"
}

variable "actor" {
  type        = string
  description = "The user that has requested the demo repository"
}

variable "target_repository" {
  type = object({
    owner = string
    repo  = string
  })
  description = "The repository target to create"
}

# Values necessary to deploy via Actions
variable "azure" {
  type = object({
    service_plan_name   = string
    resource_group_name = string
  })
  description = "The Azure resource details that the demo will be deploying to"
}

variable "template_directory_path" {
  type = string
  description = "Path to the local template files that are to be used to populate the new repository"
}

variable "repository_files" {
  type = set(string)
  default = [
    ".vscode/launch.json",
    ".vscode/tasks.json",
    ".vscode/settings.json",
    "bicep/webapp.bicep",
    ".github/CODEOWNERS",
    ".github/codeql/codeql-config.yml",
    ".github/dependabot.yml",
    ".github/workflows/command_pull_request_review.yml",
    ".github/workflows/deploy_environment__azure.yml",
    ".github/workflows/scripts/deploymentLabel.js",
    ".github/workflows/scripts/buildParameters.js",
    ".github/workflows/scripts/deployEnvironment.js",
    ".github/workflows/scripts/deploymentManager.js",
    ".github/workflows/container_scan.yml",
    ".github/workflows/destroy_environment__azure.yml",
    ".github/workflows/initialize.yml",
    ".github/workflows/label_deployment_trigger.yml",
    ".github/workflows/build_test_publish.yml",
    ".github/workflows/cleanup_pr_environment.yml",
    ".github/workflows/octodemobot_pr_review.yml",
    ".github/workflows/dependency_review.yml",
    ".github/workflows/code_scanning.yml",
    ".github/commands/pull_request_review.yml",
    ".github/issues/rating-feature-issue.md",
    "Dockerfile",
    "patches/jetty-version-10.0.2/patches.tgz",
    "patches/apply_patch_set_in_branch.sh",
    "patches/create_patch_set.sh",
    "patches/jetty-version-10.0.6/patches.tgz",
    "patches/apply_patch_set.sh",
    "patches/log4j-vulnerability/README.md",
    "patches/log4j-vulnerability/patches.tgz",
    "patches/secret-scanning/patches.tgz",
    "patches/book-search/patches.tgz",
    "patches/book-star-rating/patches.tgz",
    "patches/book-search-bug-fix/patches.tgz",
    ".demo/scripts/destroy_before.sh",
    ".demo/scripts/create_after.sh",
    ".demo/scripts/ansible/destroy_azure_apps.yml",
    ".demo/scripts/ansible/post_repository_creation.yml",
    ".demo/terraform/main.tf",
    ".demo/terraform/modules/azure/main.tf",
    ".demo/terraform/modules/azure/variables.tf",
    ".demo/terraform/modules/github/main.tf",
    ".demo/terraform/modules/github/variables.tf",
    ".demo/terraform/variables.tf",
    ".demo/secrets.json",
    "LICENSE.md",
    ".devcontainer/devcontainer.json",
    ".devcontainer/docker-compose.yml",
    "src/main/resources/version.properties",
    "src/main/resources/log4j2.xml",
    "src/main/webapp/static/books_fr.properties",
    "src/main/webapp/static/books_en.properties",
    "src/main/webapp/static/books_nl.properties",
    "src/main/webapp/static/bootstrap-3.4.1-dist/js/bootstrap.min.js",
    "src/main/webapp/static/bootstrap-3.4.1-dist/js/bootstrap.js",
    "src/main/webapp/static/bootstrap-3.4.1-dist/js/npm.js",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap.min.css.map",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap-theme.css",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap.css",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap-theme.css.map",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap.min.css",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap-theme.min.css.map",
    "src/main/webapp/static/bootstrap-3.4.1-dist/css/bootstrap.css.map",
    "src/main/webapp/static/bootstrap-3.4.1-dist/fonts/glyphicons-halflings-regular.eot",
    "src/main/webapp/static/bootstrap-3.4.1-dist/fonts/glyphicons-halflings-regular.woff2",
    "src/main/webapp/static/bootstrap-3.4.1-dist/fonts/glyphicons-halflings-regular.woff",
    "src/main/webapp/static/bootstrap-3.4.1-dist/fonts/glyphicons-halflings-regular.ttf",
    "src/main/webapp/static/bootstrap-3.4.1-dist/fonts/glyphicons-halflings-regular.svg",
    "src/main/webapp/static/images/invertocat.svg",
    "src/main/webapp/static/images/covers/month.jpg",
    "src/main/webapp/static/images/covers/pragmatic.jpg",
    "src/main/webapp/static/images/covers/lean.jpg",
    "src/main/webapp/static/images/covers/scrum.jpg",
    "src/main/webapp/static/images/covers/chasm.jpg",
    "src/main/webapp/static/images/covers/think.jpg",
    "src/main/webapp/static/images/star.png",
    "src/main/webapp/static/images/heart.png",
    "src/main/webapp/static/images/octocat.png",
    "src/main/webapp/static/images/favicon.ico",
    "src/main/webapp/static/books_de.properties",
    "src/main/webapp/static/books.html",
    "src/main/java/com/github/demo/service/BookDatabaseImpl.java",
    "src/main/java/com/github/demo/service/BookServiceException.java",
    "src/main/java/com/github/demo/service/BookUtils.java",
    "src/main/java/com/github/demo/service/BookService.java",
    "src/main/java/com/github/demo/service/BookDatabase.java",
    "src/main/java/com/github/demo/DemoServer.java",
    "src/main/java/com/github/demo/model/Book.java",
    "src/main/java/com/github/demo/servlet/StatusServlet.java",
    "src/main/java/com/github/demo/servlet/BookServlet.java",
    "src/test/java/com/github/demo/service/BookServiceTest.java",
    "src/test/java/com/github/demo/model/BookTest.java",
    "ansible/destroy_azure_webapps.yml",
    "pom.xml",
    ".gitignore",
    "README.md",
    "docs/README.md"
  ]
}