### common

```hcl

  module "main" {
      source = "hadenlabs/repository/gitlab"
      version = "0.0.0"

      providers = {
        gitlab = gitlab
      }

      name        = "repository-example"
      description = "gitlab project"
      visibility  = "public"
  }

```
