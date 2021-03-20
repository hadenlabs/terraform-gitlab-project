module "main" {
  providers = {
    gitlab = gitlab
  }
  source      = "git://github.com/hadenlabs/terraform-gitlab-project.git?ref=0.1.1"
  name        = var.project_name
  description = var.project_description
  visibility  = "public"
}
