locals {
  default_settings = {
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

  settings = merge(local.default_settings, try(var.settings, {}))
}

resource "gitlab_project" "this" {
  name             = var.name
  description      = var.description
  visibility_level = var.visibility

  mirror                                           = local.settings.mirror
  import_url                                       = local.settings.import_url
  default_branch                                   = local.settings.default_branch
  issues_enabled                                   = local.settings.issues_enabled
  merge_requests_enabled                           = local.settings.merge_requests_enabled
  pipelines_enabled                                = local.settings.pipelines_enabled
  approvals_before_merge                           = local.settings.approvals_before_merge
  wiki_enabled                                     = local.settings.wiki_enabled
  snippets_enabled                                 = local.settings.snippets_enabled
  container_registry_enabled                       = local.settings.container_registry_enabled
  lfs_enabled                                      = local.settings.lfs_enabled
  merge_method                                     = local.settings.merge_method
  only_allow_merge_if_pipeline_succeeds            = local.settings.only_allow_merge_if_pipeline_succeeds
  only_allow_merge_if_all_discussions_are_resolved = local.settings.only_allow_merge_if_all_discussions_are_resolved
  initialize_with_readme                           = local.settings.initialize_with_readme
  packages_enabled                                 = local.settings.packages_enabled

  tags = var.tags

  namespace_id = var.namespace_id

  lifecycle {
    prevent_destroy = false
    ignore_changes = [
      default_branch,
      issues_enabled,
      description
    ]
  }
}
