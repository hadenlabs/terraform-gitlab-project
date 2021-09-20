module "main" {
  source = "../.."
  providers = {
    gitlab = gitlab
  }

  name         = var.name
  description  = var.description
  visibility   = var.visibility
  namespace_id = var.namespace_id
}
