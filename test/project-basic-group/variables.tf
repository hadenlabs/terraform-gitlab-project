variable "group_name" {
  type        = string
  description = "The path of the group."
}

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

# Gitlab token
variable "gitlab_token" {
  type        = string
  description = "token gitlab"
}
