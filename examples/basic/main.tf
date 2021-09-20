module "main" {
  providers = {
    gitlab = gitlab
  }
  source      = "../.."
  name        = var.project_name
  description = var.project_description
  visibility  = "public"
}
