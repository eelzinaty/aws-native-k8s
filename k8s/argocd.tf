resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.7.16" # Specify the desired chart version

  create_namespace = true # Creates the namespace if it doesn't exist

  # Path to your custom values.yaml
  values = [file("${path.module}/files/argocd/values.yaml")]

  # Wait for the Helm release to be deployed
  wait = true

  # Optional: Define timeout
  timeout = 600 # in seconds

  depends_on = [
    kubernetes_manifest.general_ingress,
  ]
}
