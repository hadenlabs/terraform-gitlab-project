variable "project_name" {
  type        = string
  description = "The name of the project."
}

variable "project_description" {
  type        = string
  description = "description of project."
  default     = ""
}

variable "gitlab" {
  description = "vars for gitlab"
  type = object({
    token = string
  })
}
