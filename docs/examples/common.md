### common

```hcl

  module "main" {
      source = "hadenlabs/project/gitlab"
      version = "0.1.1"

      providers = {
        gitlab = gitlab
      }

      name        = "project-example"
      description = "gitlab project"
      visibility  = "public"
  }

```
