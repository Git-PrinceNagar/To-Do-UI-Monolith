variable "vns" {
  type = map(object({
    vn_name            = string
    location           = string
    resource_group_name = string
    address_space      = list(string)
    dns_servers        = list(string)
    subnets            = map(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}