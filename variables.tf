variable "name" {
  type        = string
  description = "The name of the repository."
}

variable "description" {
  type        = string
  description = "The description of the repository."
}

variable "visibility" {
  type        = string
  description = "The visibility of the repository private or public."
  default     = "private"
}

variable "settings" {
  type        = map(any)
  description = "Create and manage settings."
  default     = {}
  validation {
    condition = can([for field in keys(try(var.settings, {})) : !contains([
      "mirror",
      "default_branch",
      "issues_enabled",
      "merge_requests_enabled",
      "pipelines_enabled",
      "approvals_before_merge",
      "wiki_enabled",
      "snippets_enabled",
      "container_registry_enabled",
      "lfs_enabled",
      "merge_method",
      "only_allow_merge_if_pipeline_succeeds",
      "only_allow_merge_if_all_discussions_are_resolved",
      "initialize_with_readme",
      "packages_enabled",
    ], field)])
    error_message = "ERROR: Key not permitted."
  }
}

variable "tags" {
  type        = list(string)
  description = "topics or tags of project."
  default     = []
}
