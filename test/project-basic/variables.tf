variable "name" {
  type        = string
  description = "The name of the project."
}

variable "description" {
  type        = string
  description = "description of project."
  default     = ""
}

variable "visibility" {
  type        = string
  description = "The visibility of the project private or public."
  default     = "private"
}

variable "namespace_id" {
  type        = string
  description = "The namespace (group or user) of the project."
  default     = null
}

# Gitlab token
variable "gitlab_token" {
  type        = string
  description = "token gitlab"
}
