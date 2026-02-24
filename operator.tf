data "ns_connection" "operator" {
  name     = "operator"
  contract = "block/*/tailscale"
}

locals {
  tailnet_dns_name = data.ns_connection.operator.outputs.tailnet_dns_name
}
