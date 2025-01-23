resource "kubernetes_manifest" "karpenter_node_pool" {
  manifest = yamldecode(templatefile("${path.module}/files/karpenter/node-pool-general-purpose.yaml", {}))
}
