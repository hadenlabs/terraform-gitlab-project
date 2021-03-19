variable "repository_name" {
  type        = string
  description = "The name of the repository."
}

variable "repository_description" {
  type        = string
  description = "description of repository."
  default     = ""
}

variable "gitlab" {
  description = "vars for gitlab"
  type = object({
    token = string
  })
}
