variable "tailnet_nodes" {
  type = list(object({
    name       = string
    tailnet_ip = string
  }))
}

locals {
  tailnet_node_map = { for cur in var.tailnet_nodes : cur.name => cur.tailnet_ip }
}
