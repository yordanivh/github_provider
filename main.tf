provider "github" {
  token        = var.github_token
  organization = var.github_organization
}


resource "github_repository" "repo_in_organization" {
  name        = "Organization_repo"
  description = "This is a test"

  private = false
}
