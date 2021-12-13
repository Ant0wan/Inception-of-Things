variable "application" {
  description = "Application configuration."
  type = object({
    namespace = string
    resources = list(string)
  })
}
