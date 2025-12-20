variable "resource_groups" {
  type = map(object({
    rg_name     = string
    location = string
    tags     = map(string)
  }))
}
