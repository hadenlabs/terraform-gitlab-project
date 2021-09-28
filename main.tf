locals {
  default = {
    settings = {
      mirror                                           = false
      default_branch                                   = "develop"
      issues_enabled                                   = true
      merge_requests_enabled                           = true
      pipelines_enabled                                = true
      approvals_before_merge                           = 0
      wiki_enabled                                     = true
      snippets_enabled                                 = true
      container_registry_enabled                       = true
      lfs_enabled                                      = true
      merge_method                                     = "merge"
      only_allow_merge_if_pipeline_succeeds            = false
      only_allow_merge_if_all_discussions_are_resolved = false
      initialize_with_readme                           = false
      packages_enabled                                 = true
      import_url                                       = ""
    }
    namespace_id = null
  }

  input = {
    namespace_id = try(var.namespace_id, local.default.namespace_id)
    name         = var.name
    description  = var.description
    visibility   = var.visibility
    settings     = merge(local.default.settings, try(var.settings, {}))
  }

  generated = {
    namespace_id = local.input.namespace_id
    name         = local.input.name
    description  = local.input.description
    visibility   = local.input.visibility
    settings     = local.input.settings
  }

  outputs = {
    namespace_id = local.generated.namespace_id
    name         = local.generated.name
    description  = local.generated.description
    visibility   = local.generated.visibility
    settings     = local.generated.settings
  }
}

resource "gitlab_project" "this" {
  name             = local.outputs.name
  description      = local.outputs.description
  visibility_level = local.outputs.visibility

  mirror                                           = local.outputs.settings.mirror
  import_url                                       = local.outputs.settings.import_url
  default_branch                                   = local.outputs.settings.default_branch
  issues_enabled                                   = local.outputs.settings.issues_enabled
  merge_requests_enabled                           = local.outputs.settings.merge_requests_enabled
  pipelines_enabled                                = local.outputs.settings.pipelines_enabled
  approvals_before_merge                           = local.outputs.settings.approvals_before_merge
  wiki_enabled                                     = local.outputs.settings.wiki_enabled
  snippets_enabled                                 = local.outputs.settings.snippets_enabled
  container_registry_enabled                       = local.outputs.settings.container_registry_enabled
  lfs_enabled                                      = local.outputs.settings.lfs_enabled
  merge_method                                     = local.outputs.settings.merge_method
  only_allow_merge_if_pipeline_succeeds            = local.outputs.settings.only_allow_merge_if_pipeline_succeeds
  only_allow_merge_if_all_discussions_are_resolved = local.outputs.settings.only_allow_merge_if_all_discussions_are_resolved
  initialize_with_readme                           = local.outputs.settings.initialize_with_readme
  packages_enabled                                 = local.outputs.settings.packages_enabled

  tags = var.tags

  namespace_id = local.generated.namespace_id

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      default_branch,
      issues_enabled,
      description
    ]
  }
}
