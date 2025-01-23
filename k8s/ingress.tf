resource "kubernetes_namespace" "ingress" {
  metadata {
    name = "ingress"
  }
}

resource "kubernetes_manifest" "ingress_class" {
  manifest = yamldecode(templatefile("${path.module}/files/ingress/ingress-class.yaml", {
  }))
}

resource "kubernetes_manifest" "general_ingress" {
  manifest = yamldecode(templatefile("${path.module}/files/ingress/ingress.yaml", {
    domain  = "NA"
    acm_arn = "NA"
  }))

  depends_on = [
    kubernetes_namespace.apps,
    kubernetes_manifest.ingress_class,
  ]
}
