variable "application" {
  description = "Application configuration."
  type = object({
    name = string
    namespace = string
    resources = list(string)
    labels = map(any)
  })
}
