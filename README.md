# github_provider
This is a sample repo of the GitHub provider in Terraform

# What this repo does
This repo contains code that creates a repository in a organization in github. Organization is specified by the user.
U ser must have write permissins to the organization so that he can create the repo there.

# Why use this repo

Using this repo's code will help with the understanding of how the github provider in terraform can be used to manage your organization and team members.

# How to use this repo

 * Install Terraform
 ```
 https://www.terraform.io/downloads.html
 ```
 
 * Clone this repository
 
 ```
 git clone https://github.com/yordanivh/github_provider
 ```
 
 * Change directory
 
 ```
 cd github_provider
 ```
 
 * Create a github organization - This can be done by using the plus sign in the upper right corner of the github page.Click on New Organization and follow the process.
 
 * Create a token with which you will be able to autheticate. This can be done with Settings>Developer Settings> Personal Access Token.
 
 * For security reasons variable values are not shown in this repo. You can add them as shown in the example below.
Add this information to variables.tf file.

 ```
 variable "github_token" {
  type    = string
  default = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}

variable "github_organization" {
  type    = string
  default = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
}
 ```

 
 * Initialize the project ( Terraform will download provider plugins)
 
 ```
 terraform init
 ```
 
 * Plan the operation so that you see what actions will be taken
 
 ```
 terraform plan
 ```
 
 * Run Terraform apply to create the resources
 
 ```
 terraform apply
 ```
 
 * Check on the organization page in github if the repo was created.
 
 * To destroy the created resources. Delete the repo, from the repo setting directly in Github.
  
# Sample output

1.Run init to download necessary plugins
```
github_provider (newbranch) $ terraform init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.github: version = "~> 2.2"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

2. Run plan to see a plan of action

```
github_provider (newbranch) $ terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_repository.repo_in_organization will be created
  + resource "github_repository" "repo_in_organization" {
      + allow_merge_commit = true
      + allow_rebase_merge = true
      + allow_squash_merge = true
      + archived           = false
      + default_branch     = (known after apply)
      + description        = "This is a test"
      + etag               = (known after apply)
      + full_name          = (known after apply)
      + git_clone_url      = (known after apply)
      + html_url           = (known after apply)
      + http_clone_url     = (known after apply)
      + id                 = (known after apply)
      + name               = "Organization_repo"
      + private            = false
      + ssh_clone_url      = (known after apply)
      + svn_url            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

3.Run apply to create the repo

```
github_provider (newbranch) $ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # github_repository.repo_in_organization will be created
  + resource "github_repository" "repo_in_organization" {
      + allow_merge_commit = true
      + allow_rebase_merge = true
      + allow_squash_merge = true
      + archived           = false
      + default_branch     = (known after apply)
      + description        = "This is a test"
      + etag               = (known after apply)
      + full_name          = (known after apply)
      + git_clone_url      = (known after apply)
      + html_url           = (known after apply)
      + http_clone_url     = (known after apply)
      + id                 = (known after apply)
      + name               = "Organization_repo"
      + private            = false
      + ssh_clone_url      = (known after apply)
      + svn_url            = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

github_repository.repo_in_organization: Creating...
github_repository.repo_in_organization: Creation complete after 6s [id=Organization_repo]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```
