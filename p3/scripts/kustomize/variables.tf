variable "application" {
  description = "Application configuration."
  type = object({
    name = string
    namespace = string
    labels = object({
      part_of = string
      app     = string
    })
    resources = list(string)
  })
}
