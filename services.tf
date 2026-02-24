resource "kubernetes_service_v1" "services" {
  for_each = local.tailnet_node_map

  lifecycle {
    ignore_changes = [
      metadata[0].annotations["cloud.google.com/neg"],
      spec[0].external_name,
    ]
  }

  metadata {
    name      = each.key
    namespace = local.kubernetes_namespace

    annotations = {
      "tailscale.com/tailnet-ip" = each.value
    }
  }

  spec {
    type          = "ExternalName"
    external_name = "unused" # this must be specified, but gets overriden by the tailscale operator
  }
}
