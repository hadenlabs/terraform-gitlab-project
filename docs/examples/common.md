### common

```hcl

  module "main" {
      source = "hadenlabs/project/gitlab"
      version = "0.3.3"

      providers = {
        gitlab = gitlab
      }

      name        = "project-example"
      description = "gitlab project"
      visibility  = "public"
  }

```

### with group new

```hcl

  resource "gitlab_group" "example" {
    name        = "example"
    path        = "example"
    description = "An example group"
  }

  module "main" {
      source = "hadenlabs/project/gitlab"
      version = "0.3.3"

      providers = {
        gitlab = gitlab
      }

      namespace_id = gitlab_group.example.id
      name        = "project-example"
      description = "gitlab project"
      visibility  = "public"
  }

```

### with group exist

```hcl

  data "gitlab_group" "example" {
    full_path = "example"
  }

  module "main" {
      source = "hadenlabs/project/gitlab"
      version = "0.3.3"

      providers = {
        gitlab = gitlab
      }

      namespace_id = data.gitlab_group.example.id
      name        = "project-example"
      description = "gitlab project"
      visibility  = "public"
  }

```
