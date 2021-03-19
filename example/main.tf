module "main" {
  providers = {
    gitlab = gitlab
  }
  source      = "git://github.com/hadenlabs/terraform-gitlab-repository.git?ref=0.0.0"
  name        = var.repository_name
  description = var.repository_description
  visibility  = "public"
}
